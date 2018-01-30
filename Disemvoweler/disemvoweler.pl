#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed24633@gmail.com
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project:
# Description:
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
my @result;
my @vowels = qw/a e i o u/;
my @vowelsSeq;
# say ($vowels[0]);
#######################
#Subroutines:
#############

#######################
#I/O
####
while(<>)
{
        chomp;
        @stack = split('');
        print (@stack);
        print Dumper(@stack);
         map {if ($_ ~~ @vowels)  {push (@vowelsSeq, $_)}} @stack;
         for (my $i = 0; $i < scalar @stack; $i++) {
            if ($stack[$i] ~~ @vowels or $stack[$i] =~ /[^\S\n]/)
             {
                splice @stack, $i, 1;
             }
         }

}
print @stack;
print "\n";
print @vowelsSeq;
