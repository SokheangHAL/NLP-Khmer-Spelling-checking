#!/usr/bin/perl
use warnings;
use strict;
use utf8;
#This code is using for copy the incorrect line to pass it after ||| and the change the <wrong word> to (wrong word/) 
# Written HAL SOKHEANG and support by Ye Kyaw Thu, IDRI, CADT, Cambodia
# How to run:
# e.g. perl ./ replacewr-co.pl <input-file>
# $ perl ./replacewr-co.pl ./input.txt > out.txt
#last update:  30 october 2022

binmode(STDIN,  ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

    while (my $line = <$inputFILE>)
    {
     
     if($line!~/^\s*$/)
         {
    chomp ($line);
    print $line;

        $line =~ s/\<(.*?)\>/\($1\/\)/g;
    print"\b|||$line\n";
        }
    }
#bug : after we run it the resullt was add the Enter of the next line 
# except the last line was same as our wanted output.     
# to solve this problem you need to convert the format of the text (input file is Window(CRLF) to Unix(LF) UFT8 )
#change from CRLF to Unicode .uft8 file
#$dos2unix -n <input-file> <output-file>.uft8
#$perl replacewr-co.pl inputfile.uft8 > outputfilename.txt
close($inputFILE);
