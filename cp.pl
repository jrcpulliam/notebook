use strict;
use 5.10.0;

my $root = "http://dushoff.github.io/notebook";
my $base = $root;
$base =~ s|.*/|/|;

while(<>){
	next unless /<script/;
	print;
	last;
}
while(<>){
	print;
	last if /<.script/
}

while(<>){
	next unless /<article/;
	print;
	last;
}
while(<>){
	s/$base/$root/g;
	print;
	last if /<.article/
}
