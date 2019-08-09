use strict;
use 5.10.0;
use URI::Escape;

my $base = "https://www.rottentomatoes.com/search/?search=";

$/ = "";

while(<>){
	next unless /[|].*min/;
	s/.*\n//;
	s/\n.*//s;
	my $safe = uri_escape($_);
	say "<p>[$_]($base$safe)";
}
