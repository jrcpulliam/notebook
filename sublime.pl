use strict;
use 5.10.0;

use bignum;
use integer;
use POSIX;

sub sublimate{
	my ($n) = @_;
	my $block = 10**ceil(log($n)/log(100));
	my $x = floor($n/$block);
	my $y = $n % $block;
	return($x**2 + $y**2);
}

while(<>){
	next if /^$/;
	next if /^#/;
	chomp;
	my $s = sublimate($_);
	say "$_ ⇒ $s" unless $_==$s;
}
