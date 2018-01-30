#!/usr/bin/perl
##################################
# Ahmed AlJehairan
# ahmed24633@gmail.com
# ahmed.jehairan@utexas.edu
# GitHub: https://github.com/aj326
##################################
# Project: Scrapes new querys from CL; notifies by email
# Description: search, filter, email, cron
#######################
use v5.10;
use Data::Dumper;
use autodie;
use strict;
use warnings;
use XML::Simple;
use LWP::Simple;
use Date::Parse;
use Email::Send;
use Email::Send::Gmail;
use Email::Simple::Creator;
my $debug = 0;
my $msg   = '';
print "Query? ";
my $query = <>;
my $s     = $query;
$query =~ s/ /\+/g;
say $query if ($debug);
my $feed = 'http://austin.craigslist.org/search/sss?query='. $query.'&s=0&sort=rel&format=rss';
while (1) {
    my $xml = get($feed);
    my $ref = XMLin($xml);
    my $items = $ref->{item};
    if ($debug) {
        print "$xml";
        print Data::Dumper->Dump( [$items] );
        say ref $ref;
        exit;
    }

    for my $item (@$items) {
        my $title = $item->{title};
        $title =~ s/\&#x\d+;/\$/;
        $title =~ s/\&gt/>/g;
        $title =~ s/\&lt/</g;
        my $url = $item->{link};
        if ( ( $title !~ m/wanted/i )
            && time - str2time( $item->{"dc:date"} ) <= 600 )
        {
            $msg = $msg . "$item->{'dc:date'}\n  $title\n    $url\n\n";
        }
    }
    say '$msg is ' . $msg if ($debug);

    # say time - 24*3600;
    if ($msg) {
        my $email = Email::Simple->create(
            header => [
                From    => 'ahmed24633@gmail.com',
                To      => 'ahmed24633@gmail.com',
                Subject => 'Craigslist\'s "'
                    . $s
                    . '" Result ' . '('
                    . localtime . ')',
            ],
            body => $msg,
        );
        my $sender = Email::Send->new(
            {   mailer      => 'Gmail',
                mailer_args => [
                    username => 'ahmed24633@gmail.com',
                    password => 'PA$$gmail',
                ]
            }
        );

        # send the message
        eval { $sender->send($email) };
        die "Error sending email: $@" if $@;
    }
    $msg = '';
    undef($ref);
    sleep 600;
}
