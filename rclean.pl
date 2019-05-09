use strict;
use 5.10.0;

while(<>){
	last if /quit R/;
}

while(<>){
	s/^[> ]*$//;
	s/^[> ]*#/#/;
	print;
}
