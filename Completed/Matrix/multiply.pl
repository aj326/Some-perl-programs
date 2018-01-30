#! /usr/bin/perl
use matrix;
use v5.10;
$matrix = matrix->new;

while(<>){
	$row = [split];
	if(@{$row}){
		$matrix->add_row($row);
	}
	else {
		push @matrices, $matrix;
		$matrix = matrix->new;
	}
}

foreach (@matrices){
	$result = matrix->new;
	$s = pop @matrices;
	$f = pop @matrices;
	
	$result = $f * $s;
	
	push @matrices, $result;
}
print "\n";
say "Result: ";
say "======="; 
print "$result\n";
