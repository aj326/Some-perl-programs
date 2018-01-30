#!/usr/bin/perl
{
    package Graph;
use Moose;
has 'vertices' => (
                is => 'rw',
                isa => 'ArrayRef[Vertex]',);
}
{
package Vertex;
use Moose;
has 'name' => (
                is => 'rw',
                isa => 'Str',);
}
1;
