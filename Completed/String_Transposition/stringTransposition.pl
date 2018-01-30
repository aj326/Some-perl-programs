#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: String Transposition (http://www.reddit.com/r/dailyprogrammer/comments/1m1jam/081313_challenge_137_easy_string_transposition)
# Description: 
#######################
use v5.10;
use Data::Dumper;	
use autodie;
use strict;
use List::AllUtils qw( max );
#######################
#Variables:
###########
my @stack;
my @chars;
my $maxLength;
my $col;
my $string;
my $dummy = <>;
#######################
#Subroutines:
#############

#######################
#I/O
####
while(<>){
	chomp;
	$maxLength = max(length, $maxLength);
	push (@stack, $_);
}

$col = (scalar (@stack)) - 1;

foreach (@stack){
	push(@chars, split("", $_));
	for (length .. $maxLength-1) {
		push(@chars, " ");
	}
}

for (my $row = 0; $row < $maxLength; $row++) {
	for (0 .. $col){
		$string = $string . $chars[$row+$_*$maxLength];
	}
	say $string;
	$string = "";
}