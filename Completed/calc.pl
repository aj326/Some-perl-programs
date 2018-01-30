#!/usr/bin/perl
###############
use v5.10;

#Functions:
##########
sub sqrt{
  return sqrt $_[1];
}
#sum: Replace the stack with the sum of all the numbers that were on the stack.
sub sum{
  my $s;
  foreach (@_){
    $s+=$_;
  }
  return $s;
}
#mean: Replace the stack with the arithmetic mean of all the numbers that were on the stack. 
#This value should be equal to the sum of all the numbers divided by the size of the stack.
sub mean{
  return (sum @_)/(scalar @_);
}

#squares: Multiply each number on the stack by itself.
sub squares{
  foreach (@_){
    $_ *= $_;}
}

#residuals: Subtract from each number on the stack the mean of all the numbers on the stack.
sub residuals{
  my $m = mean @_;
  foreach (@_){
    $_-=$m;
  }
}

#stddev: Replace the stack with the standard deviation of all the numbers that were on the stack. 
#This value should be equal to the square root of the mean of the squares of the residuals of all the numbers on the stack.
sub stddev{
  my @r = residuals @_;
  my @s = squares @_;
  my $m = mean @_;
  return sqrt $m;
}
sub prettyPrint{
  print "|| Stack: ";
  map {
  if (($_ ne 'squares' and  $_ ne 'residuals') ) {print $_ . ' | '} }  @_;
  say;
}  

#Calculator:
############

my @stack;

while(<>){
  chomp;

  if ($_ eq '+')
  {$_ = ((pop @stack) + (pop @stack));
    prettyPrint @stack;}

  if ($_ eq '-')
  {$_ = ((pop @stack) - (pop @stack));
    prettyPrint @stack;}

  if ($_ eq '*')
  {$_ = ((pop @stack) * (pop @stack));
    prettyPrint @stack;}

  if ($_ eq '/')
  {$_ = ((pop @stack) / (pop @stack));
    prettyPrint @stack;}


  if ($_ eq 'sqrt')
  {$_ = sqrt (pop (@stack)) ;
    prettyPrint @stack;}

  if ($_ eq 'sum')
  { $_ = sum(@stack); 
    @stack = ();
    prettyPrint @stack;}

  if ($_ eq 'mean')
  { $_ = mean(@stack); 
    @stack = ();
    prettyPrint @stack;}

  if ($_ eq 'stddev')
  { $_ = stddev(@stack); 
    @stack = ();
    prettyPrint @stack;}


  if ($_ eq 'squares')
  { 
    squares(@stack);
    prettyPrint @stack;
  }
  if ($_ eq 'residuals')
  { 
    residuals(@stack);
    prettyPrint @stack;
  }
  if ($_ ne 'squares' and $_ ne 'residuals')
  {
    push(@stack, $_)} ;
}

