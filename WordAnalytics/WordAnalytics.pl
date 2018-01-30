#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: Word Analytics
# # Description: 
# Read a given text file (no special formatting, just a plain ASCII text file) and print off the following details:
# Number of words
# Number of letters
# Number of symbols (any non-letter and non-digit character, excluding white spaces)
# Top three most common words (you may count "small words", such as "it" or "the")
# Top three most common letters
# Most common first word of a paragraph (paragraph being defined as a block of text with an empty line above it) (Optional bonus)
# Number of words only used once (Optional bonus)
# All letters not used in the document (Optional bonus)
# Please note that your tool does not have to be case sensitive, meaning the word "Hello" is the same as "hello" and "HELLO".
#######################
use v5.10;
use Data::Dumper;	
use autodie;
use strict;
#######################
#Variables:
###########
my @paragraphs;

my @words;
my %words;
my $wc;
	
my @letters;
my %letters = map {$_ => 0} ("a" ... "z");
my $lc;

my $start;
my @parFirstWord;
my %parFirstWord;

my $symbol;
my $sc;

my @wordsOnlyUsedOnce;

my @notUsedLetters;

my $i;
#######################
#Subroutines:
#############

#######################
#I/O
####
while(<>){
	chomp;
	my $in = $_;
	($start) = $in =~ /\A(\w+)\s/;
	$parFirstWord{$start}++;
	push (@paragraphs, $_);
}
foreach (@paragraphs) {
	foreach my $w (split / /, lc $_) {
		if ($w =~ /(\w+)(\W)?/){
			$words{$1}++;
			$wc++;
			$sc++ if $2;
			# print "$word [$symbol]|";
			foreach my $c (split //, lc $1){
				# print "<$c>";
				$letters{$c}++;
				$lc++;
			}
		}
	}
}
# print Dumper(%words);
# print Dumper(%letters);
$i = 0;
foreach (sort { ($words{$b} <=> $words{$a}) || ($a cmp $b) } keys %words) {
	if ($i<3){
		push @words, $_;
	}
	else{
		last;
	}
	$i++;
}
$i = 0;
foreach (sort { ($letters{$b} <=> $letters{$a}) || ($a cmp $b) } keys %letters) {
	if ($i<3){
		push @letters, $_;
	}
	else{
		last;
	}
	$i++;
}

foreach (sort { ($parFirstWord{$b} <=> $parFirstWord{$a}) || ($a cmp $b) } keys %parFirstWord) {
		push @parFirstWord, $_;	
		last;
}
foreach (keys %words){
	push @wordsOnlyUsedOnce, $_ if ($words{$_} == 1)
}
foreach (keys %letters){
	push @notUsedLetters, $_ if (!$letters{$_})
}
say "Number of words = $wc.\n";
say "Number of letters = $lc.\n";
say "Number of symbols = $sc.\n";
say "Top three most common words: @words.\n";
say "Top three most common letters: @letters.\n";
say "Most common first word in paragraph: @parFirstWord.\n";
say "Words only used once:\n@wordsOnlyUsedOnce.\n";
say "Letters not used: @notUsedLetters.";
say "$words{ut}, $words{commodo}, $words{ad}";
say Dumper %parFirstWord;
say "$parFirstWord{Lorem}, $parFirstWord{Vestibulum}";