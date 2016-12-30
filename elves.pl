use warnings;
use strict;
use 5.10.0;

## Go through one round of elves. Mark those removed, and return a new array of the others
sub round{
	my $a = shift;

	my @marked;
	my $pos=@$a;
	for my $i (0..$#$a) {
		next if defined $marked[$i];
		$marked[($pos/2)%@$a]=1;
		$pos += 3;
	}

        return [map { $a->[$_] } grep { !defined $marked[$_] } 0..$#$a];
}

# Reduce until you have one elf, and then return its number
sub pick{
	my $a = shift;
        $a = round($a) while @$a > 1;
        return $a->[0];
}

sub calc{
	my $a = shift @_;
	my $p=1;
	$p *=3 while $p<$a;
	my $q = $p/9;
	return $a - $q*int((9*$q-$a)/$q);
}

my $a=3014387;

my @a=1..$a;
say pick(\@a);
say calc($a);
say calc(2);

