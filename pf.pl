use strict;
use 5.10.0;

print(5%3);

my $base=1e9;
my $ind=2;
my $curr=1;
my $prev=1;

while($curr){
	my $new = ($curr + $prev) % $base;
	$prev = $curr;
	$curr = $new;
	$ind++;
}

say"";
say($ind);
