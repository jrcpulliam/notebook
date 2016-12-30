use strict;
use 5.10.0;

my $base=100;
my @first;

sub tree{
	my @low = @{shift @_};
	my @high = @{shift @_};
	my @mid = ($low[0]+$high[0], $low[1]+$high[1]);
	mid[2] = 0;
}

say join ", ", @{tree([0, 1], [4, 6])}; 
