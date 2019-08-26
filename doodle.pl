use strict;
use 5.10.0;
use Time::Piece;
use Time::Seconds;

my %inputs;
while(<>){
	next if /^$/;
	next if /^#/;
	my($tag, $val) = /^(\S+)\s+(.*)/;
	$inputs{$tag} = $val;
}

## Defaults
my $tstep = 1;

## Inputs 
my $d0 = $inputs{d0};
my $days = $inputs{days};
my $tstart = $inputs{tstart};
my $tend = $inputs{tend};
#### Optional inputs
$tstep = $inputs{tstep} if defined $inputs{tstep};
### Capitalized inputs represent time zones
### Tag "weekends" will include weekend days in output
### Tag "nodates" for generic weekday output

## Format time from hours
## TODO Set between 0001 and 2400 (and use stars and daggers for changed values)
sub hmin{
	my ($t) = @_;
	my $h = int($t);
	my $m = int(60*($t-$h)+0.5);
	return sprintf("%02d", $h) . sprintf("%02d", $m);
}

## print header
print("Date");
foreach (sort keys %inputs){
	next unless /^[A-Z]/;
	print ", $_";
}
print("\n");

$d0 = Time::Piece->strptime($d0, "%b %d %Y");
for (my $d=$d0; $d<$d0+$days*ONE_DAY; $d+=ONE_DAY){
	unless (defined $inputs{weekends}){
		next if $d->strftime("%a") =~ /^S/;
	}
	my $day = $d->strftime("%a %d %b");
	$day =~ s/ .*// if defined $inputs{nodates};
	say $day;
	for (my $t=$tstart; $t<=$tend; $t+=$tstep){
		foreach (sort keys %inputs){
			next unless /^[A-Z]/;
			print ", " . hmin($t + $inputs{$_});
		}
		say "";
	}
}
