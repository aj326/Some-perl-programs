#!/usr/bin/perl
###############
#YUP TIRED AS FUCK
use v5.10;

sub f{
	my $n = shift;
		if ($n > 100) {
			$n = $n - 10;

			if ($n == 91){
			say "\t\t = $n";
		} 
			else{
				say "\t\t = M($n) since $n > 100";
		}
	}
	
		else {
			$n = $n+11;
			say "\t\t = M(M($n)) since $n <= 100";
			f(f($n));
	}

}
while (<>) {
	chomp;
	print "M($_)";
	f($_);
	# body...
}