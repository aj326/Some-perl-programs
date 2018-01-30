#!/usr/bin/perl
package Matrix;
use v5.10;
sub new{
  my $type =  shift;
  my  $self = [];
  bless $self, $type; 
  # say $self;
}
sub getR{
  my $self = shift;
  return $r;}
sub getC{
  my $self = shift;
  return $c;}

sub string{ 
  my $self = shift;
  for my $row (0 .. $r-1){
    for my $col (0 .. $c-1){
      if ($col < $c-1){
        print $self->[$row][$col]." , ";}
      else{
        print $self->[$row][$col];}
    }
    print "\n";
  }
}
sub print{
  my $self = shift;
  string $self;
}

sub add_row{
  my $self = shift;
  $c = 0; 
  foreach (@_){
    $self->[$r][$c] = $_;
    ++$c;
    #say $self[$r][$c];
  }
  $r++;
}
use overload
"-"=>sub {
  my ($first , $second) = @_;
  my $third= Matrix->new;
  for my $row (0 .. @$first-1){
    for my $col (0 .. @$first-1){
      $sum =  $first->[$row][$col] - $second->[$row][$col];
      push @$temp, $sum;
    }
    $third->add_row($tmp);
    $tmp = ();
  }
return $third;};


"+"=>sub {
  my ($first , $second) = @_;
  my $third= Matrix->new;
  for my $row (0 .. @$first-1){
    for my $col (0 .. @$first-1){
      $sum =  $first->[$row][$col] + $second->[$row][$col];
      push @$temp, $sum;
    }
    $third->add_row($tmp);
    $tmp = ();
  }
return $third;};
  "*"=>sub{
    my ($first , $second) = @_;
  my $third= Matrix->new;
  for my $row (0 .. @$first-1){
    for my $Ocol (0 .. @{$second->[0]}-1){
    for($c=0; $c<@{$first->[0]}; $c++){
				$prod += $first->[$row][$c]*$second->[$c][$Ocol];
			}
    
      push @$temp, $prod;
      $prod = 0;
    }
    $third->add_row($tmp);
    $tmp = ();
  
  }
  return $third;};
1;
