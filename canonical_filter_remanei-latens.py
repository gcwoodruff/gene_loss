#getting canonical proteins for Janna Fierst-annotated genomes. this works for remanei and latens.

#solution from https://bioinformatics.stackexchange.com/questions/595/how-can-longest-isoforms-per-gene-be-extracted-from-a-fasta-file/603#603


#!/usr/bin/env python
from Bio import SeqIO
import sys
import re

lastGene = None
longest = (None, None)
for rec in SeqIO.parse(sys.argv[1], "fasta"):
    gene = re.sub('-R[A-Z]+$','', rec.id)
    l = len(rec)
    if lastGene is not None:
        if gene == lastGene:
            if longest[0] < l:
                longest = (l, rec)
        else:
            lastGene = gene
            SeqIO.write(longest[1], sys.stdout, "fasta")
            longest = (l, rec)
    else:
        lastGene = gene
        longest = (l, rec)
SeqIO.write(longest[1], sys.stdout, "fasta")
