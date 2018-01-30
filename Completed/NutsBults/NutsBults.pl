#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: Nuts & Bults
# Description: 
	#You have just been hired at a local home improvement store to help compute the proper costs of inventory. The current prices are out of date and wrong; you have to figure out which items need to be re-labeled with the correct price.
	#You will be first given a list of item-names and their current price. You will then be given another list of the same item-names but with the correct price. You must then print a list of items that have changed, and by how much.
#######################
use v5.10;
use Data::Dumper;	
use autodie;
use strict;
#######################
#Variables:
###########
my %h;
my @entry;
my $name;
my $price;
my $plus;
my $items;
#######################
#Subroutines:
#############

#######################
#I/O
####
$items = <>;
while(<>){
	chomp;
	@entry = split;
	($name, $price) = @entry;
	if (exists $h{$name}){
		$h{$name} = $price - $h{$name};
	}
	else{
		$h{$name} = $price;
	}
}
foreach (sort keys %h) {
	if ($h{$_}){
		$plus = "+" if ($h{$_} > 0);
		say "$_ $plus$h{$_}";
		$plus = "";
	}
}