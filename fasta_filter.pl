#fasta_filter.pl by Kevin Nyberg
use strict; use warnings;

# this script is going to filter out a subset of a multi-fasta file
# perl fasta_filter.pl IDfile.txt multifasta_in.txt multifasta_out.txt

# first, create an array with a list of all gene IDs you want to retain.

open(IN, "< $ARGV[0]") or die "can't open file $ARGV[0]\n";

my @gene_IDs = ();
my $gene_count = 0;

while (my $line = <IN>) {
		if ($line =~ m/(\S+)/) {
				push(@gene_IDs, $1);
				$gene_count++;
		}
}

foreach my $gene_ID (@gene_IDs) {
	print $gene_ID, "\n";
}

print "Total gene_IDs found = $gene_count\n";

# Now, open a multifasta file and pull out all the entries from your array and add them to the buffer.

my $buffer = "";
my $state = "search";
my $gene_added = 0;

foreach my $gene_ID (@gene_IDs) {
open(IN, "< $ARGV[1]") or die "can't open file $ARGV[1]\n";
		while (my $line = <IN>) {
				if ($state eq 'search') {
						if ($line =~ m/$gene_ID/) {
								$buffer .= $line;
								$gene_added++;
								$state = "add";
								next;
						}
				} elsif ($state eq 'add') {
						if ($line =~ m/^>/) {
								$state = "search";
								last;
						} else {
								$buffer .= $line;
						}
				}
		}
}		

# print out the buffer to a new fasta file

open(OUT, "> $ARGV[2]") or die "could not open file for writing";
		print OUT $buffer, "\n";
close OUT;

print "Total gene fastas added = $gene_added\n";