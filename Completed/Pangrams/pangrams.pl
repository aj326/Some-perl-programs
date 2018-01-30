#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: Panagrams
# Description: implement a program that takes a series of strings (one per line)
# and prints either True (the given string is a pangram), or False (it is not).
#######################
use v5.10;
use Data::Dumper;	
use autodie;
use strict;
my @stack;
my $n;
#######################

#Subroutines:
#############
sub isPan{
	my $r = "False ";
	my %ans;
	my $string = shift @_;
	# say $string;
	my @c = split ("", $string);
	foreach my $c (@c){
		$c = lc $c;
		if(($c=~/\w/)){
			$ans{$c}++;
		}
	}
	# say (sort keys %ans);
	if(keys %ans == 26){
		$r = "True "
	}
	# for keys

	foreach ((sort keys %ans)){

		$r = $r . $_ . ": " . $ans{$_} . ", ";
	}
	return substr($r, 0, -2) . "."
}
#I/O
####
while(<>){
        chomp;
        push (@stack, $_);
}
$n = shift @stack;
for (my $i = 0; $i < $n; $i++) {
	say (@stack);
	say isPan(@stack);
	shift @stack;
}