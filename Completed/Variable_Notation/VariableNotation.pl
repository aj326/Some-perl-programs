#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: Verbal Notation
# Description: 
# When writing code, it can be helpful to have a standard (Identifier naming convention) that describes how to define all your variables and object names. This is to keep code easy to read and maintain. Sometimes the standard can help describe the type (such as in Hungarian notation) or make the variables visually easy to read (CamcelCase notation or snake_case). Your goal is to implement a program that takes an english-language series of words and converts them to a specific variable notation format. Your code must support CamcelCase, snake_case, and capitalized snake_case.

#######################
use v5.10;
use Data::Dumper;	
use autodie;
use strict;
my @stack;
#######################

#Subroutines:
#############
sub convert{
	my $r;
	my $t = shift @_;
	# say "this is  $t";
	my $string = shift @_;
	# say "this is $string";
	my @words = split (" ",$string);
	foreach	(@words){
	$_ = ucfirst $_;
		}
	if($t == 0){
		$words[0] = lc $words[0];
		# say $t;
		$r = join("",@words);
		# say "in t == 0";
		# say $r;
	}
	if($t == 1){
	$r = join("_",@words);	
	}
	if($t == 2){
		my @r = map {uc $_ } @words;
		$r = join("_",@words);	
	}
	# say $r;
	# say "end of fun";
	say $t . "\n" . $r;
	return shift @stack;
}
#I/O
####
while(<>){
        chomp;
        push (@stack, $_) if ($_ ne "");

}
        # say Dumper(@stack);
while (@stack) {
# shift @stack;
# say Dumper @stack;
convert(@stack);
shift @stack;
# say Dumper @stack;}
}

