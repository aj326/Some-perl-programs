#!/usr/bin/perl
###############
use v5.10;

#Functions:
##########
sub calc{
	# -> two arrays
	# <- one number
	my $x = shift;
	my $y = shift;
	my @a = @$x;
	my @b = @$y;
	$delta_x = $a[1]-$b[1];	
	$delta_y = $a[2]-$b[2];
	$dist = sqrt ($delta_x * $delta_x + $delta_y * $delta_y);
	$f = ($a[0]*$b[0])/($dist * $dist);
	# map {print "$_ , "} @a;
	# print "\n";
	# map {print "$_ , "} @b;
	# print "\n";
}

#Calculator:
############
@d;
while(<>){
  chomp;
  $x =  [$1, $2, $3] if(/(.+) (.+) (.+)/);
  push @d, $x;
}
say calc (@d) if scalar @d % 2 == 0;