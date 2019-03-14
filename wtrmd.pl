use strict;
use 5.10.0;

while(<>){
	unless (/<source-file.*\.mk/ .. /<\/source-file/){
		chomp;
		s/====(.*)====/####$1/;
		s/===(.*)===/###$1/;
		s/==(.*)==/##$1/;
		s|.*</source-file>.*|```|;
		s/.*source-file.*filename="([^"]*)\.R".*/```{r}/;
		s/\$\$/\$/g;
		say;
	}
}
