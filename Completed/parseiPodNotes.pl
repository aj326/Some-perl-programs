#!/usr/bin/perl
use v5.10;
use Data::Dumper;
my %note;
$/ = "\f\n";
open $f, '<', 'notes.txt'
	or die "not found";

while (<$f>){
	chomp;
	if (/Subject: (.+)\n^Date: (.+)T\n(.+)\n$/ms) {		
		$note{$1} = [$2, $3];
	}
}
$/ ="\n";
print keys %note;
mkdir("Untangled\ Notes");
foreach (keys %note){
	print "FILENAME: $_\n";
	open FH, ">/home/ahmed/Dropbox/Code/perl/Untangled\ Notes/$_.txt";
	map {print FH "$_\n"}	@{$note{$_}};
	close FH;
}