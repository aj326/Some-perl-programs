#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed24633@gmail.com
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: Novel Compression, pt. 1: Unpacking the Data
# Description:
    # The first section of the input we are going to
    # is just a list of words present in the text we're decompressing.
    # The first line of input will be a number N representing how many
    # entries the dictionary has. Following from that will be a list of N words,
    # receive will be the dictionary. This dictionary
    # on separate lines. This will be our simple dictionary. After this will be the data.
#######################
use v5.10;
use Data::Dumper;
use autodie;
use strict;
use warnings;
#######################
#Variables:
###########
my @stack;
my @compress;
my $t;
#######################
#Subroutines:
#############

#######################
#I/O
####
while(<>){
        chomp;
        push (@stack, $_);
}
@compress = split(/ /,pop @stack);
while ($_ = shift @compress) {
    if($_ = /(\!|R|E|\.|\d+)(.?)/)

    {
         $t = $2;
        # say $1;
        if($1 =~ /(\d+)/)
        {

            if($t eq "!")
            {
                print uc $stack[$1];
            }
            elsif($t eq "^")
            {
                print ucfirst $stack[$1];
            }
            else
            {
                print $stack[$1];
            }

        }
        if($1 eq "!")
        {
            print "!";
        }
        if($1 eq "R")
        {
            print "\n";
        }
        if($1 eq "E")
        {
           print "\n"; die;
        }
    }
}
# HELLO!
# My name is Stan.
