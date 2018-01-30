#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: Anagrams
# Description: 

#######################
use v5.10;
use Data::Dumper;	
use autodie;
use strict;
use integer;
my @words;
my @stack;
my $dict;
#######################

open $dict, '<', 'enable1.txt';

#Subroutines:
#############
sub anagrams{
	my @ans;
	my $word = lc shift @_;
	if( length($word) == 1){
		push (@ans, $word);
		return;
	}
	my $len = length($word)/2;
	my @word = split("", $word);
	if ($word[0] ne $word[length($word)-1]){
		return false;
	}
	for (my $i = 0; $i < $len; $i++) {
		if ($word[$i] ne $word[length($word)-i]){
			return false
		}
	}
		
#I/O
####
while(<$dict>){
        chomp;
        push (@words, $_);
}

while(<>){
	chomp;
	push (@stack, $_);
}