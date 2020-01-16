use strict;
use 5.10.0;

use bignum;
use integer;
use POSIX;

my $min=1; 
my $max=1000; 
my $pow=4;
my $num=2;
my $stop=1;

my %tab;

for (my $i=2; $i<=$max;$i++){
	for (my $j=1; $j<=$i; $j++){
		push @{$tab{$i**$pow+$j**$pow}}, [$i, $j];
	}
}

my @sums = sort { $a <=> $b } keys %tab;

foreach my $sum (@sums){
	if (scalar @{$tab{$sum}}>=$num){
		say "$sum: " . scalar @{$tab{$sum}};
		foreach my $sol (@{$tab{$sum}}){
			say join ", ", @{$sol};
		}
		exit if $stop;
	}
}
