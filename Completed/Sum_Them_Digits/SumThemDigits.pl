#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: 
# Description: 

#######################
use v5.10;
use Data::Dumper;	
use autodie;
use integer;
my @stack;
#######################

#Subroutines:
#############
sub sum{
$n = shift @_;
return 1 + (($n-1)%9);
}
#I/O
####
while(<>){
        chomp;
        push (@stack, $_);
}
while(@stack > 0){
say sum(@stack);
shift @stack;
}