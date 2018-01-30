#!/usr/bin/perl
#WRONG! FIX!
# Ahmed AlJehairan
# ahmed24633@gmail.com
# GitHub: aj326
use v5.10;
use Data::Dumper;	
use autodie;
use strict;
my @stack;
use integer;
my $n;
#######################
#LESSONS LEARNED: Use integers when you are going
#play with numbers
#Subroutines:
#############


#I/O
####
while(<>){
	chomp;
	push (@stack, $_);	
}
sub calc{
	$n = shift;
	my $tot;

	while ($n > 0){
		$tot += $n % 10;
		$n = $n / 10;
		}

	if ($tot>9){
		calc($tot)
	}
	else{
	return $tot;}
	}
foreach (@stack){
		say calc($_) if ($_>0);
	}

