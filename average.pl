use strict;
use 5.10.0;

my $base=5;
my $nmax=10;
my @first;

sub tree{
	my $num = shift @_;
	my @low = @{shift @_};
	my @high = @{shift @_};
	my @mid = ($low[0]+$high[0], $low[1]+$high[1]);
	$mid[2] = int($base*$mid[0]/$mid[1] + 1/2);
	say "";
	say $low[2];
	say $mid[2];
	say $high[2];
	say "Low" unless $mid[2]==$low[2];
	say "High" unless $mid[2]==$high[2];
	$first[$mid[2]] = $mid[0]+$mid[1] unless defined $first[$mid[2]];
	return if $num >=$nmax;
	tree($num+1, \@low, \@mid) unless $mid[2]==$low[2];
	tree($num+1, \@mid, \@high) unless $mid[2]==$high[2];
}

tree(0, [0, 1, 0], [1, 1, $base]); 

say "Hello";
say join " ", @first;
