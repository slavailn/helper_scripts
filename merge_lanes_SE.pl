#! /usr/bin/perl
use strict; use warnings;
use List::MoreUtils qw(uniq);

my @sample_names = (); # array to store sample names
my @file_names = (); # array to store file names

# Read from standard input
while(<STDIN>)
{
    chomp;
    if ( $_ =~ /R1/ ) # if line is a legit fastq name, get the sample name
    {
        my @parts = split(/_L/, $_);
        push(@sample_names, $parts[0]);
        push(@file_names, $_);
    }
}

# Get unique sample names
@sample_names = uniq @sample_names;

# Form "cat" commands to merge separate fastq files originating
# from different flowcell lanes

for my $sample_name ( @sample_names )
{
    my @files_to_merge = grep(/$sample_name/, @file_names);
    my $out_name = join("", $sample_name, ".fastq");
    my $command = join(" ", "zcat", @files_to_merge, ">", $out_name);
    print "$command\n";
}



