use strict;
use 5.10.0;

## Go through one round of elves. Mark those removed, and return a new array of the others
sub round{
	my @a = @{shift @_};

	my @marked;
	my $pos=@a;
	for (my $i=0; $i<@a; $i++){
		next if defined $marked[$i];
		$marked[($pos/2)%@a]=1;
		$pos += 3;
	}

	my @next;
	for (my $i=0; $i<@a; $i++){
		push @next, $a[$i] unless defined $marked[$i];
	}
	return \@next;
}

# Reduce until you have one elf, and then return its number
sub pick{
	my @a = @{shift @_};
	return $a[0] if @a == 1;
	return pick(round(\@a));
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

