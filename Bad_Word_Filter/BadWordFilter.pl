#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: Bad Words Filter
# Description: Censor Bad Words
#######################
use v5.10;
use Data::Dumper;	
use autodie;
use strict;
#######################
#Variables:
###########
my @badwords;
#######################
#Subroutines:
#############

#######################
#I/O
####
open my $badWordsFile, '<', "badwords.txt";
@badwords = <$badWordsFile>;
map {lc s/[[:punct:]\s]//g} @badwords;
local $/ = ' '; #to read input word be word
while(<>){
        /([a-zA-Z0-9]+)([[:punct:]]?)( |\n+)?/;
        $_ = $1;
        $_ = "*" x length if (lc $_ ~~ @badwords);
        print "$_$2$3";
}