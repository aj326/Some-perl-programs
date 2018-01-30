#! /usr/bin/perl
open $dict, '<', '/usr/share/dict/words'
    or die "Whoops: $!";

#hash up the dictionary
while (<$dict>) {
    chomp;
    $text{$_} = 0;
}
close($dict);

# access text file, increment what needs incrementing, delete what needs deleting
while (<>) {
    chomp;
    @words_in_line = /[a-z](?:[a-z']*[a-z])?/ig;
    foreach (@words_in_line) {
        $_ = lc $_;    # lowercase this.
        if ( exists( $text{$_} ) ) {
            $text{$_}++;
        }
        else {
            $ntext{$_}++;
            delete $text{$_};
        }
    }
}

# purge zero values
foreach ( keys %text ) {
    if ( $text{$_} == 0 ) {
        delete $text{$_};
    }
}

# print shit out
$l   = 0;
$len = keys %text;
print "Number of distinct words: $len \n";
foreach ( sort { $text{$b} <=> $text{$a} } keys %text ) {
    $l++;
    print "$_ : $text{$_}\n";
    if ( $l == 10 ) {
        last;

    }
}
$l   = 0;
$len = keys %ntext;
print "Number of distinct words not in dictionary: $len \n";
foreach ( sort { $ntext{$b} <=> $ntext{$a} } keys %ntext ) {
    $l++;
    print "$_ : $ntext{$_}\n";
    if ( $l == 10 ) {
        last;

    }
}

