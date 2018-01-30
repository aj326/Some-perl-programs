#! /usr/bin/perl
use matrix;
use v5.10;
say "hit enter twice for result in interactive mode; CRTL-D Only exits the program";
$matrix = matrix->new();
$c = 0;

while (<>){
  $row = [split]; # splits a line and makes it $row a reference to the anonymous array

  if (@$row){
    $matrix->add_row($row);
  }
  
  elsif ($c == 0){
    $c++;
    push @matrices, $matrix; #store matrix to the stack
    $matrix = matrix->new();
  }

  elsif ($c == 1){
    push @matrices, $matrix;
    foreach (@matrices){
      $r = matrix->new();
      $f = shift @matrices;
      $s = shift @matrices;
      $r = $f - $s;
      print "\n";
      say "Result: ";
      say "======="; 
      print $r;
    }

    $c=0;
    $matrix = matrix->new;
  }

}

