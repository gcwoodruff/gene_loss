
#get the orthogroup files ; in orthofinder_and_blast_results.zip

#remove first col
 awk '{$1=""}1' Orthogroups_GeneCount_caeno_only.csv | awk '{$1=$1}1' > Orthogroups_GeneCount_caeno_only_no_col_1.csv


#ok, make the files....

cd shared_orthogroups_as_species_included


#just found in remanei


awk 'BEGIN {FS="\t"} $14 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 1

#remanei and latens,

awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 2


# plus briggsae
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0  {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 3


#plus nigoni

awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 4

#plus sp26  

awk 'BEGIN {FS="\t"}  $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 5

#plus sp40  

awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 6

#plus sinica  

awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 7


#plus tropicalis  

awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 8



#plus wallacei  

awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 9



#plus doughertyi  

awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 10

#plus brenneri
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 11

#plus sp34
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 12

#plus elegans
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 13


#plus kamaaina
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 14


#plus sp28
awk 'BEGIN {FS="\t"}  $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 15


#plus sp39
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 16


#plus sp29
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 17

#plus sp32
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 18

#plus afra
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 19


#plus japonica
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 && $8 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 20


#plus sp31
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 && $8 != 0 && $20 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 21

#plus castelli
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 && $8 != 0 && $20 != 0 && $5 !=0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 22

#plus angaria
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 && $8 != 0 && $20 != 0 && $5 !=0 && $2 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 23


#plus sp38
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 && $8 != 0 && $20 != 0 && $5 !=0 && $2 != 0 && $23 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 24


#plus virilis
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 && $8 != 0 && $20 != 0 && $5 !=0 && $2 != 0 && $23 != 0 && $27 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 25


#plus plicata
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 && $8 != 0 && $20 != 0 && $5 !=0 && $2 != 0 && $23 != 0 && $27 != 0 && $13 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 26


#plus sp21
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 && $8 != 0 && $20 != 0 && $5 !=0 && $2 != 0 && $23 != 0 && $27 != 0 && $13 != 0 && $16 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 27



#plus monodelphis
awk 'BEGIN {FS="\t"} $14 != 0  && $10 != 0 && $4 != 0 && $12 !=0  && $17 !=0 && $25 !=0 && $15 != 0  && $26 !=0 && $28 !=0 && $6 !=0 && $3 != 0 && $22 !=0 && $7 != 0 && $9 != 0  && $18 != 0 && $24 != 0 && $19 != 0 && $21 != 0 && $1 !=0 && $8 != 0 && $20 != 0 && $5 !=0 && $2 != 0 && $23 != 0 && $27 != 0 && $13 != 0 && $16 != 0 && $11 != 0 {print} ' Orthogroups_GeneCount_caeno_only_no_col_1.csv > 28

#count the lines

wc -l 1
wc -l 2
wc -l 3
wc -l 4
wc -l 5
wc -l 6
wc -l 7
wc -l 8
wc -l 9
wc -l 10
wc -l 11
wc -l 12
wc -l 13
wc -l 14
wc -l 15
wc -l 16
wc -l 17
wc -l 18
wc -l 19
wc -l 20
wc -l 21
wc -l 22
wc -l 23
wc -l 24
wc -l 25
wc -l 26
wc -l 27
wc -l 28

#these are the data plotted in supplemental figure 6.

#14386 1
#13702 2
#11128 3
#10928 4
#10670 5
#10495 6
#10117 7
#9524 8
#9392 9
#9298 10
#8817 11
#8472 12
#8411 13
#7745 14
#7119 15
#7069 16
#6798 17
#6722 18
#6688 19
#6385 20
#6216 21
#6092 22
#5634 23
#5596 24
#5545 25
#5250 26
#4942 27
#4836 28

