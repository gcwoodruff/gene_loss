#defining essential, inessential, and non-phenotype genes and connecting them with lost genes

wkdir="/projects/phillipslab/gavincw/reproducing_lost_genes_1-22-19"

mkdir $wkdir/essential_genes

mkdir $wkdir/essential_genes/00_phenotypes

#get just phenotypes
	#see connect_lost_genes_wormbase_boeck_transcript.sh for origin of prep_simplemine_1

cd $wkdir/essential_genes/00_phenotypes

awk  'BEGIN {FS="\t"} {OFS="\t"} {print $1,$2,$3}' $wkdir/reproduce_boeck_wb/wormbase_ontology/prep_simplemine_1 > phenotype_1


#remove genes without seq ids

grep -w -v "CELEG.N.A." phenotype_1	> phenotype_2

#remove header

sed -i '1d' phenotype_2

#replace second tab with comma

sed -i -e 's/\t/,/2' phenotype_2 

#get only genes with phenotypes

grep -v "N.A.,N.A." phenotype_2 > genes_with_phenotypes

#get essential phenotypes
	#essential phenotypes are in file essential_phenotypes.txt

#replace underscores with spaces

perl -p -i -e 's/_/ /g' essential_phenotypes.txt


#get genes with only essential phenotypes

LC_ALL=C fgrep -w -f essential_phenotypes.txt phenotype_2 > genes_with_essential_phenotypes &


#get lists...

awk  'BEGIN {FS="\t"} {OFS="\t"} {print $1}' genes_with_phenotypes | sort | uniq > genes_with_phenotypes_list

awk  'BEGIN {FS="\t"} {OFS="\t"} {print $1}' genes_with_essential_phenotypes | sort | uniq > genes_with_essential_phenotypes_list

#

mkdir $wkdir/essential_genes/01_genes_with_phenotypes
mkdir $wkdir/essential_genes/01_genes_with_phenotypes/all_caeno
mkdir $wkdir/essential_genes/01_genes_with_phenotypes/elegans_group

mkdir $wkdir/essential_genes/02_genes_with_essential_phenotypes
mkdir $wkdir/essential_genes/02_genes_with_essential_phenotypes/all_caeno
mkdir $wkdir/essential_genes/02_genes_with_essential_phenotypes/elegans_group

mkdir $wkdir/essential_genes/03_genes_with_not_essential_phenotypes
mkdir $wkdir/essential_genes/03_genes_with_not_essential_phenotypes/all_caeno
mkdir $wkdir/essential_genes/03_genes_with_not_essential_phenotypes/elegans_group

mkdir $wkdir/essential_genes/04_genes_with_no_phenotypes
mkdir $wkdir/essential_genes/04_genes_with_no_phenotypes/all_caeno
mkdir $wkdir/essential_genes/04_genes_with_no_phenotypes/elegans_group


#all phenotypes
	#the elegans constituents of lost orthogroup files are in elegans_constituents_of_lost_orthogroups.zip


cd $wkdir/lost_genes_post_of/18_comm_elegans_constituents_of_lost_og/all_caeno/

for i in *; do LC_ALL=C fgrep -w -f $i $wkdir/essential_genes/00_phenotypes/genes_with_phenotypes_list > $wkdir/essential_genes/01_genes_with_phenotypes/all_caeno/$i; done &


cd $wkdir/lost_genes_post_of/18_comm_elegans_constituents_of_lost_og/elegans_group/

for i in *; do LC_ALL=C fgrep -w -f $i $wkdir/essential_genes/00_phenotypes/genes_with_phenotypes_list > $wkdir/essential_genes/01_genes_with_phenotypes/elegans_group/$i; done &


#essential phenotypes

cd $wkdir/lost_genes_post_of/18_comm_elegans_constituents_of_lost_og/all_caeno/

for i in *; do LC_ALL=C fgrep -w -f $i $wkdir/essential_genes/00_phenotypes/genes_with_essential_phenotypes_list > $wkdir/essential_genes/02_genes_with_essential_phenotypes/all_caeno/$i; done &


cd $wkdir/lost_genes_post_of/18_comm_elegans_constituents_of_lost_og/elegans_group/

for i in *; do LC_ALL=C fgrep -w -f $i $wkdir/essential_genes/00_phenotypes/genes_with_essential_phenotypes_list > $wkdir/essential_genes/02_genes_with_essential_phenotypes/elegans_group/$i; done &


#not essential phenotypes

cd $wkdir/essential_genes/01_genes_with_phenotypes/all_caeno/

for i in *; do comm -23 <(grep -Po '\S+' $i | sort) <(grep -Po '\S+' $wkdir/essential_genes/02_genes_with_essential_phenotypes/all_caeno/$i | sort)  > $wkdir/essential_genes/03_genes_with_not_essential_phenotypes/all_caeno/$i; done &

cd $wkdir/essential_genes/01_genes_with_phenotypes/elegans_group/

for i in *; do comm -23 <(grep -Po '\S+' $i | sort) <(grep -Po '\S+' $wkdir/essential_genes/02_genes_with_essential_phenotypes/elegans_group/$i | sort)  > $wkdir/essential_genes/03_genes_with_not_essential_phenotypes/elegans_group/$i; done &

#no phenotypes

cd $wkdir/lost_genes_post_of/18_comm_elegans_constituents_of_lost_og/all_caeno/

for i in *; do comm -23 <(grep -Po '\S+' $i | sort) <(grep -Po '\S+' $wkdir/essential_genes/01_genes_with_phenotypes/all_caeno/$i | sort)  > $wkdir/essential_genes/04_genes_with_no_phenotypes/all_caeno/$i; done &

cd $wkdir/lost_genes_post_of/18_comm_elegans_constituents_of_lost_og/elegans_group/

for i in *; do comm -23 <(grep -Po '\S+' $i | sort) <(grep -Po '\S+' $wkdir/essential_genes/01_genes_with_phenotypes/elegans_group/$i | sort)  > $wkdir/essential_genes/04_genes_with_no_phenotypes/elegans_group/$i; done &

#get the numbers...

mkdir $wkdir/essential_genes/06_wc
mkdir $wkdir/essential_genes/06_wc/all_caeno
mkdir $wkdir/essential_genes/06_wc/elegans_group



cd $wkdir/essential_genes/01_genes_with_phenotypes/all_caeno
for i in *; do wc -l $i > $wkdir/essential_genes/06_wc/all_caeno/$i.any_phenotype_tmp; done
cd  $wkdir/essential_genes/06_wc/all_caeno/
cat * > any_phenotype
rm *any_phenotype_tmp

cd $wkdir/essential_genes/01_genes_with_phenotypes/elegans_group
for i in *; do wc -l $i > $wkdir/essential_genes/06_wc/elegans_group/$i.any_phenotype_tmp; done
cd  $wkdir/essential_genes/06_wc/elegans_group/
cat *any_phenotype_tmp > any_phenotype
rm *any_phenotype_tmp


cd $wkdir/essential_genes/02_genes_with_essential_phenotypes/all_caeno
for i in *; do wc -l $i > $wkdir/essential_genes/06_wc/all_caeno/$i.essential_phenotype_tmp; done
cd  $wkdir/essential_genes/06_wc/all_caeno/
cat *essential_phenotype_tmp > essential_phenotype
rm *essential_phenotype_tmp


cd $wkdir/essential_genes/02_genes_with_essential_phenotypes/elegans_group
for i in *; do wc -l $i > $wkdir/essential_genes/06_wc/elegans_group/$i.essential_phenotype_tmp; done
cd  $wkdir/essential_genes/06_wc/elegans_group/
cat *essential_phenotype_tmp > essential_phenotype
rm *essential_phenotype_tmp

cd $wkdir/essential_genes/03_genes_with_not_essential_phenotypes/all_caeno
for i in *; do wc -l $i > $wkdir/essential_genes/06_wc/all_caeno/$i.unessential_phenotype_tmp; done
cd  $wkdir/essential_genes/06_wc/all_caeno/
cat *unessential_phenotype_tmp > unessential_phenotype
rm *unessential_phenotype_tmp


cd $wkdir/essential_genes/03_genes_with_not_essential_phenotypes/elegans_group
for i in *; do wc -l $i > $wkdir/essential_genes/06_wc/elegans_group/$i.unessential_phenotype_tmp; done
cd  $wkdir/essential_genes/06_wc/elegans_group/
cat *unessential_phenotype_tmp > unessential_phenotype
rm *unessential_phenotype_tmp


cd $wkdir/essential_genes/04_genes_with_no_phenotypes/all_caeno
for i in *; do wc -l $i > $wkdir/essential_genes/06_wc/all_caeno/$i.no_phenotype_tmp; done
cd  $wkdir/essential_genes/06_wc/all_caeno/
cat *no_phenotype_tmp > no_phenotype
rm *no_phenotype_tmp


cd $wkdir/essential_genes/04_genes_with_no_phenotypes/elegans_group
for i in *; do wc -l $i > $wkdir/essential_genes/06_wc/elegans_group/$i.no_phenotype_tmp; done
cd  $wkdir/essential_genes/06_wc/elegans_group/
cat *no_phenotype_tmp > no_phenotype
rm *no_phenotype_tmp

cd  $wkdir/essential_genes/06_wc/all_caeno/

for i in *; do awk '{print $0, FILENAME}' $i > $i.tmp; done

cat *.tmp > elegans_constituents_of_lost_og_phen_data
rm *.tmp
rm *phenotype


cd  $wkdir/essential_genes/06_wc/elegans_group/

for i in *; do awk '{print $0, FILENAME}' $i > $i.tmp; done

cat *.tmp > elegans_constituents_of_lost_og_phen_data
rm *.tmp
rm *phenotype


