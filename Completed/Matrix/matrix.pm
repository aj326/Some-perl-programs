#!/usr/bin/perl
package matrix;
use v5.10;
sub new{
  bless [];
}
sub string {
  my $self = shift;
  foreach my $r (@$self){
    print join(' ', @$r). "\n";
  }

}
sub add {
  my $f = shift;
  my $s = shift;
  $tmp = ();
  $sum = 0;
  my $res = matrix->new;
  for ($r=0; $r<@$f; $r++){ #iterate over references of rows
    for ($c=0; $c<@{$f->[0]}; $c++){ #I could store @{...} to a variable 
      $sum = $f->[$r][$c] + $s->[$r][$c]; #sum a row
      push @$tmp, $sum; #build a row in an anon. ref
    }
    $res->add_row($tmp); # add built ref of a row to result
    $tmp = ();
  }
  return $res;
}
sub subtract {
  my $f = shift;
  my $s = shift;
  $tmp = ();
  $sum = 0;
  my $res = matrix->new;
  for ($r=0; $r<@$f; $r++){ #iterate over references of rows
    for ($c=0; $c<@{$f->[0]}; $c++){ #I could store @{...} to a variable 
      $sum = $f->[$r][$c] - $s->[$r][$c]; #sum a row
      push @$tmp, $sum; #build a row in an anon. ref
    }
    $res->add_row($tmp); # add built ref of a row to result
    $tmp = ();
  }
  return $res;
}
sub multi {
  my $f = shift;
  my $s = shift;
  $tmp = ();
  $p = 0;
  my $res = matrix->new;
  for ($r=0; $r<@$f; $r++){ #iterate over references of rows
    for ($c2=0; $c2<@{$s->[0]}; $c2++){ #I could store @{...} to a variable 
      for ($c=0; $c<@{$f->[0]}; $c++){
        $p+= $f->[$r][$c] * $s->[$c][$c2]; #sum a row*col
      }
      push @$tmp, $p; #build a row in an anon. ref
      $p = 0;
    }
    $res->add_row($tmp); # add built ref of a row to result
    $tmp = ();
  }
  return $res;

}
sub add_row{
  my $self = shift;
  my $row = shift;
  push @{$self}, $row;

}
use overload
'""' => "string",
'+' => "add",
'-' => "subtract",
'*' => "multi";
1;

