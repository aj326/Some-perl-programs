#!/usr/bin/perl
###############
use v5.10;

#Variables:
##########
my $reg = qr/[\w-]+(?:\.[\w-]+)*@[^\.][\w-]+(?:\.[\w-]+)*/;
#Functions:
##########


#Driver:
########
say "Parsing ...";
while(<>){
  chomp;
  #@word = split(/ /);
  #foreach (@word){
  if( m/ ($reg)/x ) {
    $emails{$1}++;
  }
}
print (scalar keys %emails);
say " disctinct words.";
foreach my $sort (sort {$emails{$b} <=> $emails{$a} || $a cmp $b} keys %emails){
  say "$sort ($emails{$sort})";

