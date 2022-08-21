#!/usr/bin/perl
use warnings;
use strict;
use utf8;

#Spelling dictionary building demo code for internship students
# Written by Ye Kyaw Thu, IDRI, CADT, Cambodia
# How to run:
# e.g. perl ./mk-spelling-dict.pl <input-file>
# $ perl ./mk-spelling-dict.pl ./input.txt > out

binmode(STDIN,  ":utf8");
binmode(STDOUT, ":utf8");
binmode(STDERR, ":utf8");

open (my $inputFILE,"<:encoding(utf8)", $ARGV[0]) or die "Couldn't open input file $ARGV[0]!, $!\n";

   while(my $line = <$inputFILE>)
   {
      if ($line!~/^$/)
      {
         chomp ($line);
         my($error, $correction) = split('\|\|\|', $line);
         #print("Spelling Mistake: $error\n");
         #print("Correction: $correction\n"); exit();

         # "<" and ">" are meta characters and needs to be escaped if you want to match it literally and thus I used as "\<" and "\>".
         # (.*?) match any characters in a non-greedy way and then capture it
         # g for global matching
         my @error_word =($error=~/\<(.*?)\>/g); 
         #print ("@error_word\n"); 

         # "(" and ")" are meta characters and needs to be escaped if you want to match it literally and thus I used as "\(" and "\)".
         my @correct_word=($correction=~/\((.*?)\)/g);
         #print ("@correct_word\n");

         # $#Array_Name is predefined variable for getting the length of an array
         if ($#error_word != $#correct_word) {
            print("Error! Array lengths are different in line no. $.!\n");
         } 
         }
         else { 
                for my $i (0 .. $#correct_word) {
                  print("subtr($error_word[$i],\t\t$correct_word[$i])\n");
               }
            }
         }
   }

close($inputFILE);
