use strict;
use 5.10.0;

my $base=100;
my @first;

sub tree{
	my @low = @{shift @_};
	my @high = @{shift @_};
	my @mid = ($low[0]+$high[0], $low[1]+$high[1]);
	$mid[2] = int($base*$mid[0]/$mid[1] + 1/2);
	$first[$mid[2]] = $mid[0]+$mid[1] unless defined $first[$mid[2]];
	tree(\@low, \@mid) unless $mid[2]==$low[2];
	tree(\@mid, \@high) unless $mid[2]==$high[2];
}

tree([0, 1, 0], [1, 1, $base]); 

say join " ", @first;
