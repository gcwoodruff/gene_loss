#set working directory
wkdir="/projects/phillipslab/gavincw/reproducing_lost_genes_1-22-19/lost_genes_post_of"


#get just the first column

mkdir $wkdir/04_awk_rbh

#this directory has the best reciprocal blast hits in best_reciprocal_blast_hits.zip
cd $wkdir/03_reciprocal_blast_hits

for i in *; do grep -v '#' $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $1}' > $wkdir/04_awk_rbh/$i; done &

#get the genes that do not intersect with brbh

mkdir $wkdir/05_comm
mkdir $wkdir/05_comm/all_caeno
mkdir $wkdir/05_comm/elegans_group

#all caeno

cd $wkdir/02_elegans_constituents_of_lost_orthogroups/all_caeno

for i in *; do comm -23 <(grep -Po '\S+' $i | sort) <(grep -Po '\S+' $wkdir/04_awk_rbh/$i | sort)  > $wkdir/05_comm/all_caeno/$i; done &


#elegans group

cd $wkdir/02_elegans_constituents_of_lost_orthogroups/elegans_group

for i in *; do comm -23 <(grep -Po '\S+' $i | sort) <(grep -Po '\S+' $wkdir/04_awk_rbh/$i | sort)  > $wkdir/05_comm/elegans_group/$i; done &


#get the protein sequences of C. elegans constituents of the of the remaining putative lost proteins for tblastn.....


mkdir $wkdir/06_lost_proteins_for_tblastn
mkdir $wkdir/06_lost_proteins_for_tblastn/all_caeno/
mkdir $wkdir/06_lost_proteins_for_tblastn/elegans_group/

#get the sequences for tblastn

#needs script fasta_filter.pl
#needs C. elegans canonical protein set elegans.fa ; this is generated with canonical_filter_elegans.py

cd $wkdir/05_comm/all_caeno

for i in *; do perl /projects/phillipslab/gavincw/reproducing_lost_genes_1-22-19/scripts/fasta_filter.pl $i $wkdir/elegans_proteins/elegans.fa $wkdir/06_lost_proteins_for_tblastn/all_caeno/$i; done &


cd $wkdir/05_comm/elegans_group

for i in *; do perl /projects/phillipslab/gavincw/reproducing_lost_genes_1-22-19/scripts/fasta_filter.pl $i $wkdir/elegans_proteins/elegans.fa $wkdir/06_lost_proteins_for_tblastn/elegans_group/$i; done &


#now, tblastn to remove lost genes that fall outside of predicted protein-coding genes.
#these commands are in tblastn_commands.txt.

mkdir $wkdir/07_tblastn
mkdir $wkdir/07_tblastn/all_caeno/
mkdir $wkdir/07_tblastn/elegans_group/

#break up hits by query

mkdir $wkdir/08_awk_tblastn
mkdir $wkdir/08_awk_tblastn/all_caeno/
mkdir $wkdir/08_awk_tblastn/elegans_group/

mkdir $wkdir/08_awk_tblastn/elegans_group/brenneri
mkdir $wkdir/08_awk_tblastn/elegans_group/briggsae
mkdir $wkdir/08_awk_tblastn/elegans_group/doughertyi
mkdir $wkdir/08_awk_tblastn/elegans_group/kamaaina
mkdir $wkdir/08_awk_tblastn/elegans_group/latens
mkdir $wkdir/08_awk_tblastn/elegans_group/nigoni
mkdir $wkdir/08_awk_tblastn/elegans_group/remanei
mkdir $wkdir/08_awk_tblastn/elegans_group/sinica
mkdir $wkdir/08_awk_tblastn/elegans_group/sp26
mkdir $wkdir/08_awk_tblastn/elegans_group/sp34
mkdir $wkdir/08_awk_tblastn/elegans_group/sp40
mkdir $wkdir/08_awk_tblastn/elegans_group/tropicalis
mkdir $wkdir/08_awk_tblastn/elegans_group/wallacei

mkdir $wkdir/08_awk_tblastn/all_caeno/afra
mkdir $wkdir/08_awk_tblastn/all_caeno/angaria
mkdir $wkdir/08_awk_tblastn/all_caeno/brenneri
mkdir $wkdir/08_awk_tblastn/all_caeno/briggsae
mkdir $wkdir/08_awk_tblastn/all_caeno/castelli
mkdir $wkdir/08_awk_tblastn/all_caeno/doughertyi
mkdir $wkdir/08_awk_tblastn/all_caeno/elegans
mkdir $wkdir/08_awk_tblastn/all_caeno/japonica
mkdir $wkdir/08_awk_tblastn/all_caeno/kamaaina
mkdir $wkdir/08_awk_tblastn/all_caeno/latens
mkdir $wkdir/08_awk_tblastn/all_caeno/monodelphis
mkdir $wkdir/08_awk_tblastn/all_caeno/nigoni
mkdir $wkdir/08_awk_tblastn/all_caeno/plicata
mkdir $wkdir/08_awk_tblastn/all_caeno/remanei
mkdir $wkdir/08_awk_tblastn/all_caeno/sinica
mkdir $wkdir/08_awk_tblastn/all_caeno/sp21
mkdir $wkdir/08_awk_tblastn/all_caeno/sp26
mkdir $wkdir/08_awk_tblastn/all_caeno/sp28
mkdir $wkdir/08_awk_tblastn/all_caeno/sp29
mkdir $wkdir/08_awk_tblastn/all_caeno/sp31
mkdir $wkdir/08_awk_tblastn/all_caeno/sp32
mkdir $wkdir/08_awk_tblastn/all_caeno/sp34
mkdir $wkdir/08_awk_tblastn/all_caeno/sp38
mkdir $wkdir/08_awk_tblastn/all_caeno/sp39
mkdir $wkdir/08_awk_tblastn/all_caeno/sp40
mkdir $wkdir/08_awk_tblastn/all_caeno/tropicalis
mkdir $wkdir/08_awk_tblastn/all_caeno/virilis
mkdir $wkdir/08_awk_tblastn/all_caeno/wallacei


#elegans group

cd $wkdir/08_awk_tblastn/elegans_group/brenneri
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/brenneri
cd $wkdir/08_awk_tblastn/elegans_group/briggsae
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/briggsae
cd $wkdir/08_awk_tblastn/elegans_group/doughertyi
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/doughertyi
cd $wkdir/08_awk_tblastn/elegans_group/kamaaina
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/kamaaina
cd $wkdir/08_awk_tblastn/elegans_group/latens
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/latens
cd $wkdir/08_awk_tblastn/elegans_group/nigoni
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/nigoni
cd $wkdir/08_awk_tblastn/elegans_group/remanei
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/remanei
cd $wkdir/08_awk_tblastn/elegans_group/sinica
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/sinica
cd $wkdir/08_awk_tblastn/elegans_group/sp26
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/sp26
cd $wkdir/08_awk_tblastn/elegans_group/sp34
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/sp34
cd $wkdir/08_awk_tblastn/elegans_group/sp40
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/sp40
cd $wkdir/08_awk_tblastn/elegans_group/tropicalis
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/tropicalis
cd $wkdir/08_awk_tblastn/elegans_group/wallacei
awk '{print > $1}' $wkdir/07_tblastn/elegans_group/wallacei

#all caeno

cd $wkdir/08_awk_tblastn/all_caeno/afra
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/afra
cd $wkdir/08_awk_tblastn/all_caeno/angaria
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/angaria
cd $wkdir/08_awk_tblastn/all_caeno/brenneri
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/brenneri
cd $wkdir/08_awk_tblastn/all_caeno/briggsae
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/briggsae
cd $wkdir/08_awk_tblastn/all_caeno/castelli
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/castelli
cd $wkdir/08_awk_tblastn/all_caeno/doughertyi
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/doughertyi
cd $wkdir/08_awk_tblastn/all_caeno/elegans
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/elegans
cd $wkdir/08_awk_tblastn/all_caeno/japonica
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/japonica
cd $wkdir/08_awk_tblastn/all_caeno/kamaaina
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/kamaaina
cd $wkdir/08_awk_tblastn/all_caeno/latens
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/latens
cd $wkdir/08_awk_tblastn/all_caeno/monodelphis
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/monodelphis
cd $wkdir/08_awk_tblastn/all_caeno/nigoni
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/nigoni
cd $wkdir/08_awk_tblastn/all_caeno/plicata
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/plicata
cd $wkdir/08_awk_tblastn/all_caeno/remanei
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/remanei
cd $wkdir/08_awk_tblastn/all_caeno/sinica
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sinica
cd $wkdir/08_awk_tblastn/all_caeno/sp21
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp21
cd $wkdir/08_awk_tblastn/all_caeno/sp26
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp26
cd $wkdir/08_awk_tblastn/all_caeno/sp28
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp28
cd $wkdir/08_awk_tblastn/all_caeno/sp29
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp29
cd $wkdir/08_awk_tblastn/all_caeno/sp31
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp31
cd $wkdir/08_awk_tblastn/all_caeno/sp32
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp32
cd $wkdir/08_awk_tblastn/all_caeno/sp34
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp34
cd $wkdir/08_awk_tblastn/all_caeno/sp38
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp38
cd $wkdir/08_awk_tblastn/all_caeno/sp39
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp39
cd $wkdir/08_awk_tblastn/all_caeno/sp40
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/sp40
cd $wkdir/08_awk_tblastn/all_caeno/tropicalis
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/tropicalis
cd $wkdir/08_awk_tblastn/all_caeno/virilis
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/virilis
cd $wkdir/08_awk_tblastn/all_caeno/wallacei
awk '{print > $1}' $wkdir/07_tblastn/all_caeno/wallacei

#get just top hit, get columns needed for bedtools intersect (to find regions that hit the genome but not a protein coding region)

mkdir $wkdir/09_awk_tblastn
mkdir $wkdir/09_awk_tblastn/all_caeno/
mkdir $wkdir/09_awk_tblastn/elegans_group/

mkdir $wkdir/09_awk_tblastn/elegans_group/brenneri
mkdir $wkdir/09_awk_tblastn/elegans_group/briggsae
mkdir $wkdir/09_awk_tblastn/elegans_group/doughertyi
mkdir $wkdir/09_awk_tblastn/elegans_group/kamaaina
mkdir $wkdir/09_awk_tblastn/elegans_group/latens
mkdir $wkdir/09_awk_tblastn/elegans_group/nigoni
mkdir $wkdir/09_awk_tblastn/elegans_group/remanei
mkdir $wkdir/09_awk_tblastn/elegans_group/sinica
mkdir $wkdir/09_awk_tblastn/elegans_group/sp26
mkdir $wkdir/09_awk_tblastn/elegans_group/sp34
mkdir $wkdir/09_awk_tblastn/elegans_group/sp40
mkdir $wkdir/09_awk_tblastn/elegans_group/tropicalis
mkdir $wkdir/09_awk_tblastn/elegans_group/wallacei

mkdir $wkdir/09_awk_tblastn/all_caeno/afra
mkdir $wkdir/09_awk_tblastn/all_caeno/angaria
mkdir $wkdir/09_awk_tblastn/all_caeno/brenneri
mkdir $wkdir/09_awk_tblastn/all_caeno/briggsae
mkdir $wkdir/09_awk_tblastn/all_caeno/castelli
mkdir $wkdir/09_awk_tblastn/all_caeno/doughertyi
mkdir $wkdir/09_awk_tblastn/all_caeno/elegans
mkdir $wkdir/09_awk_tblastn/all_caeno/japonica
mkdir $wkdir/09_awk_tblastn/all_caeno/kamaaina
mkdir $wkdir/09_awk_tblastn/all_caeno/latens
mkdir $wkdir/09_awk_tblastn/all_caeno/monodelphis
mkdir $wkdir/09_awk_tblastn/all_caeno/nigoni
mkdir $wkdir/09_awk_tblastn/all_caeno/plicata
mkdir $wkdir/09_awk_tblastn/all_caeno/remanei
mkdir $wkdir/09_awk_tblastn/all_caeno/sinica
mkdir $wkdir/09_awk_tblastn/all_caeno/sp21
mkdir $wkdir/09_awk_tblastn/all_caeno/sp26
mkdir $wkdir/09_awk_tblastn/all_caeno/sp28
mkdir $wkdir/09_awk_tblastn/all_caeno/sp29
mkdir $wkdir/09_awk_tblastn/all_caeno/sp31
mkdir $wkdir/09_awk_tblastn/all_caeno/sp32
mkdir $wkdir/09_awk_tblastn/all_caeno/sp34
mkdir $wkdir/09_awk_tblastn/all_caeno/sp38
mkdir $wkdir/09_awk_tblastn/all_caeno/sp39
mkdir $wkdir/09_awk_tblastn/all_caeno/sp40
mkdir $wkdir/09_awk_tblastn/all_caeno/tropicalis
mkdir $wkdir/09_awk_tblastn/all_caeno/virilis
mkdir $wkdir/09_awk_tblastn/all_caeno/wallacei

#elegans group

cd $wkdir/08_awk_tblastn/elegans_group/brenneri
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/brenneri/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/briggsae
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/briggsae/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/doughertyi
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/doughertyi/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/kamaaina
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/kamaaina/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/latens
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/latens/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/nigoni
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/nigoni/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/remanei
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/remanei/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/sinica
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/sinica/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/sp26
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/sp26/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/sp34
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/sp34/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/sp40
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/sp40/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/tropicalis
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/tropicalis/$i; done
cd $wkdir/08_awk_tblastn/elegans_group/wallacei
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/elegans_group/wallacei/$i; done

#all caeno

cd $wkdir/08_awk_tblastn/all_caeno/afra
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/afra/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/angaria
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/angaria/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/brenneri
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/brenneri/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/briggsae
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/briggsae/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/castelli
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/castelli/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/doughertyi
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/doughertyi/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/elegans
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/elegans/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/japonica
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/japonica/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/kamaaina
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/kamaaina/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/latens
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/latens/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/monodelphis
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/monodelphis/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/nigoni
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/nigoni/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/plicata
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/plicata/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/remanei
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/remanei/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sinica
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sinica/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp21
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp21/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp26
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp26/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp28
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp28/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp29
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp29/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp31
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp31/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp32
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp32/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp34
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp34/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp38
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp38/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp39
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp39/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/sp40
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/sp40/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/tropicalis
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/tropicalis/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/virilis
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/virilis/$i; done
cd $wkdir/08_awk_tblastn/all_caeno/wallacei
for i in *; do head -1 $i | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $2,$7,$8,$1}' > $wkdir/09_awk_tblastn/all_caeno/wallacei/$i; done

#cat top hits

mkdir $wkdir/10_cat_tblastn
mkdir $wkdir/10_cat_tblastn/all_caeno/
mkdir $wkdir/10_cat_tblastn/elegans_group/

#elegans group

cd $wkdir/09_awk_tblastn/elegans_group/brenneri
cat * > $wkdir/10_cat_tblastn/elegans_group/brenneri
cd $wkdir/09_awk_tblastn/elegans_group/briggsae
cat * > $wkdir/10_cat_tblastn/elegans_group/briggsae
cd $wkdir/09_awk_tblastn/elegans_group/doughertyi
cat * > $wkdir/10_cat_tblastn/elegans_group/doughertyi
cd $wkdir/09_awk_tblastn/elegans_group/kamaaina
cat * > $wkdir/10_cat_tblastn/elegans_group/kamaaina
cd $wkdir/09_awk_tblastn/elegans_group/latens
cat * > $wkdir/10_cat_tblastn/elegans_group/latens
cd $wkdir/09_awk_tblastn/elegans_group/nigoni
cat * > $wkdir/10_cat_tblastn/elegans_group/nigoni
cd $wkdir/09_awk_tblastn/elegans_group/remanei
cat * > $wkdir/10_cat_tblastn/elegans_group/remanei
cd $wkdir/09_awk_tblastn/elegans_group/sinica
cat * > $wkdir/10_cat_tblastn/elegans_group/sinica
cd $wkdir/09_awk_tblastn/elegans_group/sp26
cat * > $wkdir/10_cat_tblastn/elegans_group/sp26
cd $wkdir/09_awk_tblastn/elegans_group/sp34
cat * > $wkdir/10_cat_tblastn/elegans_group/sp34
cd $wkdir/09_awk_tblastn/elegans_group/sp40
cat * > $wkdir/10_cat_tblastn/elegans_group/sp40
cd $wkdir/09_awk_tblastn/elegans_group/tropicalis
cat * > $wkdir/10_cat_tblastn/elegans_group/tropicalis
cd $wkdir/09_awk_tblastn/elegans_group/wallacei
cat * > $wkdir/10_cat_tblastn/elegans_group/wallacei

#all caeno

cd $wkdir/09_awk_tblastn/all_caeno/afra
cat * > $wkdir/10_cat_tblastn/all_caeno/afra
cd $wkdir/09_awk_tblastn/all_caeno/angaria
cat * > $wkdir/10_cat_tblastn/all_caeno/angaria
cd $wkdir/09_awk_tblastn/all_caeno/brenneri
cat * > $wkdir/10_cat_tblastn/all_caeno/brenneri
cd $wkdir/09_awk_tblastn/all_caeno/briggsae
cat * > $wkdir/10_cat_tblastn/all_caeno/briggsae
cd $wkdir/09_awk_tblastn/all_caeno/castelli
cat * > $wkdir/10_cat_tblastn/all_caeno/castelli
cd $wkdir/09_awk_tblastn/all_caeno/doughertyi
cat * > $wkdir/10_cat_tblastn/all_caeno/doughertyi
cd $wkdir/09_awk_tblastn/all_caeno/elegans
cat * > $wkdir/10_cat_tblastn/all_caeno/elegans
cd $wkdir/09_awk_tblastn/all_caeno/japonica
cat * > $wkdir/10_cat_tblastn/all_caeno/japonica
cd $wkdir/09_awk_tblastn/all_caeno/kamaaina
cat * > $wkdir/10_cat_tblastn/all_caeno/kamaaina
cd $wkdir/09_awk_tblastn/all_caeno/latens
cat * > $wkdir/10_cat_tblastn/all_caeno/latens
cd $wkdir/09_awk_tblastn/all_caeno/monodelphis
cat * > $wkdir/10_cat_tblastn/all_caeno/monodelphis
cd $wkdir/09_awk_tblastn/all_caeno/nigoni
cat * > $wkdir/10_cat_tblastn/all_caeno/nigoni
cd $wkdir/09_awk_tblastn/all_caeno/plicata
cat * > $wkdir/10_cat_tblastn/all_caeno/plicata
cd $wkdir/09_awk_tblastn/all_caeno/remanei
cat * > $wkdir/10_cat_tblastn/all_caeno/remanei
cd $wkdir/09_awk_tblastn/all_caeno/sinica
cat * > $wkdir/10_cat_tblastn/all_caeno/sinica
cd $wkdir/09_awk_tblastn/all_caeno/sp21
cat * > $wkdir/10_cat_tblastn/all_caeno/sp21
cd $wkdir/09_awk_tblastn/all_caeno/sp26
cat * > $wkdir/10_cat_tblastn/all_caeno/sp26
cd $wkdir/09_awk_tblastn/all_caeno/sp28
cat * > $wkdir/10_cat_tblastn/all_caeno/sp28
cd $wkdir/09_awk_tblastn/all_caeno/sp29
cat * > $wkdir/10_cat_tblastn/all_caeno/sp29
cd $wkdir/09_awk_tblastn/all_caeno/sp31
cat * > $wkdir/10_cat_tblastn/all_caeno/sp31
cd $wkdir/09_awk_tblastn/all_caeno/sp32
cat * > $wkdir/10_cat_tblastn/all_caeno/sp32
cd $wkdir/09_awk_tblastn/all_caeno/sp34
cat * > $wkdir/10_cat_tblastn/all_caeno/sp34
cd $wkdir/09_awk_tblastn/all_caeno/sp38
cat * > $wkdir/10_cat_tblastn/all_caeno/sp38
cd $wkdir/09_awk_tblastn/all_caeno/sp39
cat * > $wkdir/10_cat_tblastn/all_caeno/sp39
cd $wkdir/09_awk_tblastn/all_caeno/sp40
cat * > $wkdir/10_cat_tblastn/all_caeno/sp40
cd $wkdir/09_awk_tblastn/all_caeno/tropicalis
cat * > $wkdir/10_cat_tblastn/all_caeno/tropicalis
cd $wkdir/09_awk_tblastn/all_caeno/virilis
cat * > $wkdir/10_cat_tblastn/all_caeno/virilis
cd $wkdir/09_awk_tblastn/all_caeno/wallacei
cat * > $wkdir/10_cat_tblastn/all_caeno/wallacei

#repair bed for bedtools

mkdir $wkdir/11_awk
mkdir $wkdir/11_awk/all_caeno/
mkdir $wkdir/11_awk/elegans_group/

#all caeno

cd $wkdir/10_cat_tblastn/all_caeno/

for i in *; do awk '{if ($2 > $3) print $1"\t"$3"\t"$2"\t"$4; else print $1"\t"$2"\t"$3"\t"$4}' $i > $wkdir/11_awk/all_caeno/$i; done


#elegans group

cd $wkdir/10_cat_tblastn/elegans_group/

for i in *; do awk '{if ($2 > $3) print $1"\t"$3"\t"$2"\t"$4; else print $1"\t"$2"\t"$3"\t"$4}' $i > $wkdir/11_awk/elegans_group/$i; done

#bedtools software is needed for this and downstream steps

#bedtools sort for bedtools intersect

module load bedtools/2.25.0

mkdir $wkdir/12_bedtools_sort
mkdir $wkdir/12_bedtools_sort/all_caeno/
mkdir $wkdir/12_bedtools_sort/elegans_group/

#all caeno

cd $wkdir/11_awk/all_caeno/

for i in *; do bedtools sort -i $i >  $wkdir/12_bedtools_sort/all_caeno/$i; done &

cd $wkdir/11_awk/elegans_group/

for i in *; do bedtools sort -i $i >  $wkdir/12_bedtools_sort/elegans_group/$i; done &

#prep gff for bedtools intersect
#make links to gene annotation bed...

mkdir $wkdir/13_gff_bed_links/

#all of these annotations can be retreived from WormBase or CGP, versions in retrieved_genomes_versions.txt
#to get just genes and convert to bed do: 
#	awk '$3 == "gene" {print $0}' gff | grep -v "#" | awk 'BEGIN {FS="\t"} {OFS="\t"} {print $1,$4,$5,$9}' > genes.gff.bed

# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/afra $wkdir/13_gff_bed_links/afra
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/angaria $wkdir/13_gff_bed_links/angaria
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/brenneri $wkdir/13_gff_bed_links/brenneri
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/briggsae $wkdir/13_gff_bed_links/briggsae
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/castelli $wkdir/13_gff_bed_links/castelli
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/doughertyi $wkdir/13_gff_bed_links/doughertyi
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/elegans $wkdir/13_gff_bed_links/elegans
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/japonica $wkdir/13_gff_bed_links/japonica
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/kamaaina $wkdir/13_gff_bed_links/kamaaina
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/latens $wkdir/13_gff_bed_links/latens
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/monodelphis $wkdir/13_gff_bed_links/monodelphis
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/nigoni $wkdir/13_gff_bed_links/nigoni
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/plicata $wkdir/13_gff_bed_links/plicata
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/remanei $wkdir/13_gff_bed_links/remanei
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sinica $wkdir/13_gff_bed_links/sinica
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp21 $wkdir/13_gff_bed_links/sp21
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp26 $wkdir/13_gff_bed_links/sp26
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp28 $wkdir/13_gff_bed_links/sp28
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp29 $wkdir/13_gff_bed_links/sp29
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp31 $wkdir/13_gff_bed_links/sp31
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp32 $wkdir/13_gff_bed_links/sp32
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp34 $wkdir/13_gff_bed_links/sp34
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp38 $wkdir/13_gff_bed_links/sp38
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp39 $wkdir/13_gff_bed_links/sp39
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/sp40 $wkdir/13_gff_bed_links/sp40
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/tropicalis $wkdir/13_gff_bed_links/tropicalis
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/virilis $wkdir/13_gff_bed_links/virilis
# ln -s /projects/phillipslab/gavincw/lost_protein_project_1-5-17/09_tblastn/06_awk_brief_gff/wallacei $wkdir/13_gff_bed_links/wallacei

#repair gff_bed and sort

mkdir $wkdir/14_gff_bed_awk/

cd $wkdir/13_gff_bed_links/

for i in *; do awk '{if ($2 > $3) print $1"\t"$3"\t"$2"\t"$4; else print $1"\t"$2"\t"$3"\t"$4}' $i > $wkdir/14_gff_bed_awk/$i; done



mkdir $wkdir/15_gff_bed_sort/
cd $wkdir/14_gff_bed_awk/

for i in *; do bedtools sort -i $i >  $wkdir/15_gff_bed_sort/$i; done &


#bedtools intersect. here, option -v will "Only report those entries in A that have no overlap in B." These will be genes that I remove from the list of lost genes as they will fall outside of predicted protein-coding regions.


mkdir $wkdir/16_bedtools_intersect
mkdir $wkdir/16_bedtools_intersect/all_caeno/
mkdir $wkdir/16_bedtools_intersect/elegans_group/

#all caeno

cd $wkdir/12_bedtools_sort/all_caeno/

for i in *; do bedtools intersect -v -a $i -b $wkdir/15_gff_bed_sort/$i > $wkdir/16_bedtools_intersect/all_caeno/$i; done &


cd $wkdir/12_bedtools_sort/elegans_group/

for i in *; do bedtools intersect -v -a $i -b $wkdir/15_gff_bed_sort/$i > $wkdir/16_bedtools_intersect/elegans_group/$i; done &


#get genes sorted

mkdir $wkdir/17_align_outside_prot_sort
mkdir $wkdir/17_align_outside_prot_sort/all_caeno/
mkdir $wkdir/17_align_outside_prot_sort/elegans_group/

cd $wkdir/16_bedtools_intersect/all_caeno/


for i in *; do awk 'BEGIN {FS="\t"} {OFS="\t"} {print $4}' $i | sort | uniq > $wkdir/17_align_outside_prot_sort/all_caeno/$i; done &



cd $wkdir/16_bedtools_intersect/elegans_group/

for i in *; do awk 'BEGIN {FS="\t"} {OFS="\t"} {print $4}' $i | sort | uniq  > $wkdir/17_align_outside_prot_sort/elegans_group/$i; done &

#alright, remove hits that align outside of protein-coding regions

mkdir $wkdir/18_comm_elegans_constituents_of_lost_og
mkdir $wkdir/18_comm_elegans_constituents_of_lost_og/all_caeno/
mkdir $wkdir/18_comm_elegans_constituents_of_lost_og/elegans_group/



cd $wkdir/05_comm/all_caeno

for i in *; do comm -23 <(grep -Po '\S+' $i | sort) <(grep -Po '\S+' $wkdir/17_align_outside_prot_sort/all_caeno/$i | sort)  > $wkdir/18_comm_elegans_constituents_of_lost_og/all_caeno/$i; done &

cd $wkdir/05_comm/elegans_group

for i in *; do comm -23 <(grep -Po '\S+' $i | sort) <(grep -Po '\S+' $wkdir/17_align_outside_prot_sort/elegans_group/$i | sort)  > $wkdir/18_comm_elegans_constituents_of_lost_og/elegans_group/$i; done &

	#these are the C. elegans constituents of species-specific orthogroup losses, in file elegans_constituents_of_lost_orthogroups.zip


#go back and filter out the genes from the original orthogroups to get the final numbers of species-specific orthogroup losses


mkdir $wkdir/19_grep_filter_og
mkdir $wkdir/19_grep_filter_og/all_caeno/
mkdir $wkdir/19_grep_filter_og/elegans_group/

cd $wkdir/18_comm_elegans_constituents_of_lost_og/all_caeno/

for i in *; do LC_ALL=C fgrep -w -f $i $wkdir/01_species-specific_orthogroup_losses/all_caeno/$i > $wkdir/19_grep_filter_og/all_caeno/$i; done

cd $wkdir/18_comm_elegans_constituents_of_lost_og/elegans_group/

for i in *; do LC_ALL=C fgrep -w -f $i $wkdir/01_species-specific_orthogroup_losses/elegans_group/$i > $wkdir/19_grep_filter_og/elegans_group/$i; done


#count the number of C. elegans constituents of species-specific lost orthogroups

cd $wkdir/19_grep_filter_og/all_caeno/

for i in *;  do wc -l $i ; done > $wkdir/19_grep_filter_og/all_caeno_og.tsv


cd $wkdir/19_grep_filter_og/elegans_group/

for i in *;  do wc -l $i ; done > $wkdir/19_grep_filter_og/elegans_group_og.tsv

#replace the elegans values with what is in original ~/01_species-specific_orthogroup_losses (as the C. elegans constituents of lost orthogroups were themselves used to filter the list ; will by definition remove all C. elegans losses as there are no C. elegans constituents of genes lost in C. elegans)...

cd $wkdir/19_grep_filter_og/

sed -i -e 's/0 elegans/4 elegans/g' all_caeno_og.tsv
sed -i -e 's/0 elegans/41 elegans/g' elegans_group_og.tsv
