#!/usr/bin/perl
# Ahmed AlJehairan
# ahmed24633@gmail.com
# GitHub: aj326
use v5.10;
use Data::Dumper;	
use autodie;
my @stack;
my $cases;
my $words=0;
my @words = ();
my $vertices = ();
my @temp;
my $isFirst=1;
my $inCase=0;
my $matchFound;
#######################
#Classes:
#########
package Vertex{
	use Moose;
	has 'name' => (
		is => 'ro',
		isa => 'Str'
		);
	has 'first' => (
		is => 'ro',
		isa => 'Str'
		);
	has 'last' => (
		is => 'ro',
		isa => 'Str'
		);
	has 'wasVisited' => (
		is => 'rw',
		isa => 'Int');
	
}
#Subroutines:
#############
# sub shrink{
# 	my @shrunk = @_;
# 	for $i (0 .. @shrunk-1){
# 		$shrunk[$i] = substr ($shrunk[$i],0,1) . substr ($shrunk[$i], -1,1) if (length ($shrunk[$i])>2);
# 		say $shrunk[$i];
# 	}
# }

	 # say "(@_)"

sub match{
	# in: permutation
	# out: print Ordering is possible IF last letter of n word matches first letter with n+1 word
	# say "sub match list: (@_)";
	if (scalar @_ == 1){
		$matchFound = 1;
		return 1;
	}
	$w1 = shift;
	$w2 = @_[0];
	# if ($w1 =~ /(.).*(.)/){
	# $l1 = $2;}

	# if ($w2 =~ /(.).*(.)/){
	# $l2 = $1;}	
	$l1 = substr $w1, -1,1;
	$l2 = substr $w2, 0,1;
	# say "$l1 $l2";
	if ($l1 eq $l2) {
		match(@_);
	}else{
	$matchFound = 0;
	return 0;}
	}
sub perm{
	my $pnt = shift;
	my $end = shift;
	my @list = @_;
	if ($pnt == $end){
		match(@list);
		if ($matchFound == 1){
			return;
		}
	}
	for ($pnt .. $end){
		@perm = @list;
		$perm[$pnt] = $list[$_]; 
		$perm[$_] = $list[$pnt];
		unshift (@perm, $end);
		unshift (@perm, $pnt+1);
		if ($matchFound != 1) {perm(@perm);}
	}

}
#I/O
####
while(<>){
	chomp;
	
	if ($isFirst == 1){
	$cases = $_;
	$isFirst = 0;
	# say "# of cases = $cases";
	}

	elsif ($inCase == 0){
		$words = $_;
		# say 'new case';
		# say "# of words = $words";
		$inCase = 1;
	}
	elsif ($words > 0 ){
		# say "still words ($words) in case";
		# say '$_ is ' . $_;
		$words--;
		push (@words, $_);
		$l1 = substr $_, 0,1;
		$l2 = substr $_, -1,1;
		my $v = Vertex->new(name => $_,
							first => $l1,
							last => $l2,
							wasVisited => 0);
		say "created a vertex for word ", $v->name(), " first ", $v->first(), " last ", $v->last(), " wasVisited ", $v->wasVisited();
		push @vertices, $v;
		print Dumper(@vertices);
		say $$vertices[0];
		# say "words array: ";
		# say "@words";
	}
	if ($words == 0 & $inCase == 1){
		$inCase = 0;
		# shrink (@words);
		# say "(@words)";
		perm(0, @words-1, @words);
		say 'The door cannot be opened.' if ($matchFound == 0);
		say "Ordering is possible." if ($matchFound == 1);
		$matchFound = 0;
		@words = ();
	}
}


