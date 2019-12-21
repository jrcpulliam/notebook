
## Stochastic SIR simulation
## Clinic on Dynamical Approaches to Infectious Disease Data
## International Clinics on Infectious Disease Dynamics and Data Program
##
## Reshma Kassanjee, 2019
## Some Rights Reserved
## CC BY-NC 3.0 (http://creativecommons.org/licenses/by-nc/3.0/)


############################################################################################################################

## Create models and tools to display results - run once only 



## Load libraries
library(deSolve)


## Function: Transform inputs into model parameters

rate.parms <- function(r0, durinf, n){
  
  rate.beta   <- r0*(1/durinf)*(n/(n-1))
  rate.gamma  <- 1/durinf
  
  return(list(rate.beta=rate.beta,rate.gamma=rate.gamma))
}


## Function: Chain binomial implementation of SIR model

sir.cb <- function(initialcond,modelparms,timesteps){
   

  ### define model parameters and initial conditions ### 
  
  # model rate parameters
  
  rates <- rate.parms(modelparms$r0, modelparms$durinf, modelparms$N)
  rate.beta <- rates[[1]]
  rate.gamma <- rates[[2]]
  
  # total population size
  
  N <- modelparms$N
  
  # inputs for time steps
  
  t.max <- timesteps$t.max
  t.delta <- timesteps$t.delta
  
  # start at time 0
  
  t.now <- 0
  
  # current states as per initial conditions
  
  S <- initialcond[1]
  I <- initialcond[2]
  R <- N-S-I
    
  # initiatlise data frame that will contain results
  
  outdf <- data.frame(time = t.now, S = S, I = I, R = R) 
  
  ## step through time, until reaching maximum time (but can stop earlier if I = 0)
  
  while ( (t.now <  t.max) & (I>0) ){
    
    ### for each type of transition, calculate probability and generate number of transitions ###
    
    # per capita probabilities of the two transition (S-->I, I-->R)
    
    p.infection <- 1-exp(-rate.beta*I/N*t.delta)
    p.recovery <- 1-exp(-rate.gamma*t.delta)
    
    # simulate number of each transition
    
    n.infection <- rbinom(1, S, p.infection)
    n.recovery <- rbinom(1, I, p.recovery)
    
    ### update state variables and time ###
    
    t.now <- t.now + t.delta
    S <- S - n.infection 
    I <- I + n.infection - n.recovery
    R <- R + n.recovery
    
    outdf <- rbind(outdf, 
                    c(time = t.now, S = S, I = I, R = R))
    
  }
  
  if (t.now < t.max){
    outdf <- rbind(outdf, 
                   c(time = t.max, S = S, I = I, R = R))
  }
  
  return(outdf)
  
} 


## Function: System of ODEs for continous population and continuous time SIR

sir.ode <- function(t,y,parms){
  with(c(as.list(y),parms),{
    dSdt <- -rate.beta*S*I/N
    dIdt <- rate.beta*S*I/N - rate.gamma*I
    # note: population size is constant, so do not need to specify dRdt
    list(c(dSdt,dIdt))
  })
}


## Function: Solve the system of ODEs

solve.sir.ode <- function(initialcond,modelparms,timeout){
  
  rates <- rate.parms(modelparms$r0, modelparms$durinf, modelparms$N)
  
  outdf <- data.frame(lsoda(
    y = initialcond,                          # Initial conditions for population
    times = timeout,                          # Timepoints for evaluation
    func = sir.ode,                           # ODE function to evaluate
    parms = c(rates, N = sum(initialcond))    # Vector of parameters
  ))
  
  outdf$R <- sum(initialcond)-outdf$S-outdf$I
  
  return(outdf)
}


## Function: Plot ODE solution

plot.ode <- function(in.initialcond,in.modelparms,in.timeout, addplot = FALSE){
  
  y <- solve.sir.ode(in.initialcond,in.modelparms,in.timeout)
  
  if (!(addplot)){
    plot(0,0, xlim = c(0,max(in.timeout)), ylim = c(0,in.modelparms$N*1.1),
         xlab = 'Time (days)', ylab = 'Population counts', type = "n", cex.lab = 1.5, cex.axis = 1.5)
    legend('top', legend = c('S','I','R'), bty = 'n', cex = 1.5, horiz = TRUE,
           lty = 1, lwd =3, col = c('deepskyblue4','gray30', 'darkorange4'))
    abline(v = seq(0, max(in.timeout), length.out = 10),
           h = seq(0,in.modelparms$N, length.out = 10),
           lty = 2, col = 'lightgray')
  }
  
  lines(y[,1], y[,2], lwd = 5, lty = 1, col = 'deepskyblue4')
  lines(y[,1], y[,3], lwd = 5, lty = 1, col = 'gray30')
  lines(y[,1], y[,4], lwd = 5, lty = 1, col = 'darkorange4')

}
  

## Function: Plot multiple runs of chain binomial - counts of S I and R

plot.sir.cb <- function(initialcond,modelparms,timesteps,nsim = 10){
  
  # create empty plot
  
  plot(0,0, xlim = c(0,timesteps$t.max), ylim = c(0,modelparms$N*1.1),
       xlab = 'Time', ylab = 'Population counts', type = "n", cex.lab = 1.5, cex.axis = 1.5)
  abline(v = seq(0,timesteps$t.max, by = 50),
         h = seq(0,modelparms$N, length.out = 10),
         lty = 2, col = 'lightgray')
  legend('top', legend = c('S','I','R'), bty = 'n', cex = 1.5, horiz = TRUE,
         lty = 1, lwd =3, col = c('deepskyblue3','darkgrey', 'darkorange1'))
  
  # add trajectories from each simulation 
  
  for (i in 1:nsim){
    out.i <- sir.cb(initialcond,modelparms,timesteps)
    matplot(out.i[,1], out.i[,2:4], add = TRUE,
            type = 's', lwd = 2, lty = 1, col = c('deepskyblue3','darkgrey', 'darkorange1'))
  }
  
  text1 <- sprintf("N = %.0f, R0 = %.2f, Duration infection = %.2f, Prevalence = %.2f, Time step = %.2f", 
                   modelparms$N, modelparms$r0, modelparms$durinf,initialcond['I']/(initialcond['S']+initialcond['I']), in.timesteps$t.delta)
  mtext(text = text1, side = 3, line =1, cex = 1.1)
  
  
}

## Function: Plot histogram of number of new cases from chain binomial, and also show deterministic ODE count

plothistcases.sir.cb <- function(initialcond,modelparms,timeout, timesteps, nsim = 100){
  
  # intialise a vector that will store the total number of cases
  
  outcases <- rep(NA,nsim)
  
  # obtain number of new cases from each simulation 
  
  for (i in 1:nsim){
    out.i <- sir.cb(initialcond,modelparms,timesteps)
    outcases[i] <- in.initialcond[1]-tail(out.i[,2] ,1)
  }
  
  # plot
  
  xaxis.l <- 10*floor(min((outcases-10)/10))
  xaxis.u <- 10*ceiling(max((outcases+10)/10))
  hist(outcases, freq = TRUE,
       xlim = c(xaxis.l,xaxis.u), breaks = seq(from = xaxis.l-0.5 , to = xaxis.u-0.5, length.out = 20),
       xlab = 'Number of new cases', ylab = 'Frequency', main = NULL,
       cex.lab = 1.5, cex.axis = 1.5)
  
  # obtain number of new cases from ODE model and add to plot
  
  outsir <- solve.sir.ode(initialcond,modelparms,timeout)
  outsir.cases <- outsir$S[1]-tail(outsir$S,1)
  abline(v = outsir.cases, col  = 'red', lwd = 3)
  
  
}


############################################################################################################################

# Run models and plot results, using functions above 

# inputs - to try different values
in.modelparms <- list(r0 = 5, durinf = 30, N = 1000)    # R0, average duration of infection, and total population size
in.timesteps <- list(t.max = 400, t.delta = 0.2)        # maximum time and time step for chain binomial approach
in.prev <- 0.1                                          # the proportion of the population initially infected  - remainder in S, and R = 0

# other inputs
in.timeout <- seq(0,400,0.1)                            # times to output for ODE solution
# implied initial conditions; initial S and I, R = 0
in.initialcond <- c(S = in.modelparms$N - round(in.modelparms$N*in.prev), I = round(in.modelparms$N*in.prev)) 
                    
# plot chain binomial result and add ode solution
plot.sir.cb(in.initialcond,in.modelparms,in.timesteps, nsim = 10) 
# nsim for number of simulations of Chain binomial models. Keep small. May take a minute to run.
plot.ode(in.initialcond,in.modelparms,in.timeout, addplot = TRUE)

quit()

# plot histogram of new cases from chain binomial model, and also display ode number of new cases
plothistcases.sir.cb(in.initialcond,in.modelparms,in.timeout, in.timesteps, nsim = 50) 
# nsim for number of simulations of Chain binomial models. Keep small. May take a minute to run.


### TO DO: Try different input values and consider how results change...
# Play with: Population size, R0 (which affects the transmission rate)
#   duration of infection (durinf), time step size (t.delta)


# inputs 1

in.modelparms <- list(r0 = 3, durinf = 30, N = 500)  
in.timesteps <- list(t.max = 400, t.delta = 0.2)      
in.prev <- 0.1                                          

#

in.timeout <- seq(0,400,0.1)                          
in.initialcond <- c(S = in.modelparms$N - round(in.modelparms$N*in.prev), I = round(in.modelparms$N*in.prev))

plot.sir.cb(in.initialcond,in.modelparms,in.timesteps, nsim = 10) 
plot.ode(in.initialcond,in.modelparms,in.timeout, addplot = TRUE)

plothistcases.sir.cb(in.initialcond,in.modelparms,in.timeout, in.timesteps, nsim = 50) 

# inputs 2  

in.modelparms <- list(r0 = 3, durinf = 30, N = 50)  
in.timesteps <- list(t.max = 400, t.delta = 0.2)      
in.prev <- 0.1                                          

#

in.timeout <- seq(0,400,0.1)                          
in.initialcond <- c(S = in.modelparms$N - round(in.modelparms$N*in.prev), I = round(in.modelparms$N*in.prev))

plot.sir.cb(in.initialcond,in.modelparms,in.timesteps, nsim = 10) 
plot.ode(in.initialcond,in.modelparms,in.timeout, addplot = TRUE)

plothistcases.sir.cb(in.initialcond,in.modelparms,in.timeout, in.timesteps, nsim = 50) 

# etc
# copy and paste the lines of code and try different inputs
