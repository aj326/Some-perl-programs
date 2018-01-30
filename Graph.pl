#!/usr/bin/perl
use Graph;
my $graph = Graph->new(
                       vertices => [qw(mike fred dave)]);
my $v = $graph->vertices;

print "@$v\n";
