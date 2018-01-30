#!/usr/bin/perl
# Ahmed AlJehairan
# ahmed24633@gmail.com
# GitHub: aj326
use v5.10;
use Data::Dumper;	
use autodie;
my @perms;
my @stack;
#######################
@stack = (1 .. 4);
#Subroutines:
#############
# pnt first, list second
sub perm{
	my $pnt = shift;
	# say $pnt;
	my $end = shift;
	# say $end;
	my @list = @_;
	if ($pnt == $end){
		# say "reached last element $list[$pnt - 1]";
		# say "(@list)";
		push (@perms, [@list]);
		# say @perms;
		# print Dumper @perms;
	}

	for ($pnt .. $end){
		@perm = @list;
		# say " in loop (@perm)";
		$perm[$pnt] = $list[$_]; 
		# say " moved $pnt tp $_ (@perm)";
		$perm[$_] = $list[$pnt];
		# say " did opposite (@perm)";
		unshift (@perm, $end);
		unshift (@perm, $pnt+1);
		# print "$_";
		perm(@perm);
	}

}
perm (0, @stack-1, @stack);
# say @perms;
# foreach (@perms){
	# say "(@$_)";
# }
#I/O
####
# while(<>){
	# chomp;
	
# }