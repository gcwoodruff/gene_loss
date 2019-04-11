#here, the goal is to reproduce the big combined data set with lost genes, wormbase ontology term count, and boeck et al. 2016 transcriptional data.


mkdir reproduce_boeck_wb

#set working directory

wkdir="/projects/phillipslab/gavincw/reproducing_lost_genes_1-22-19"


#links to lost genes
	#elegans constituents of lost genes are in elegans_constituents_of_lost_orthogroups.zip

mkdir $wkdir/reproduce_boeck_wb/lost_genes_list
cp elegans_constituents_of_lost_og_all_caeno $wkdir/reproduce_boeck_wb/lost_genes_list/elegans_constituents_of_lost_og_all_caeno
cp elegans_constituents_of_lost_og_elegans_group $wkdir/reproduce_boeck_wb/lost_genes_list/elegans_constituents_of_lost_og_elegans_group
cp elegans_constituents_of_lost_og_sp34 $wkdir/reproduce_boeck_wb/lost_genes_list/elegans_constituents_of_lost_og_sp34

#get all elegans protein coding genes from the canonical protein coding gene set 'elegans.fa' (made from retreived protein set and prepare_protein_sets.sh)

mkdir $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes

grep ">" elegans.fa > $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes/elegans_prot_list.tmp


#remove >

cd $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes/

sed -i -e 's/>//g' elegans_prot_list.tmp

#remove lower case letter at end

sed -i -e 's/[a-z]//g' elegans_prot_list.tmp
sed -i -e 's/[a-z]//g' elegans_prot_list.tmp
mv elegans_prot_list.tmp elegans_prot_list

#now, get wormbase ontology and pfam domain counts

#wormbase ontology

mkdir $wkdir/reproduce_boeck_wb/wormbase_ontology

mkdir $wkdir/reproduce_boeck_wb/wormbase_ontology/tissue
mkdir $wkdir/reproduce_boeck_wb/wormbase_ontology/life_stage
mkdir $wkdir/reproduce_boeck_wb/wormbase_ontology/pfam_domain
mkdir $wkdir/reproduce_boeck_wb/wormbase_ontology/phenotype
mkdir $wkdir/reproduce_boeck_wb/wormbase_ontology/reference_count
mkdir $wkdir/reproduce_boeck_wb/wormbase_ontology/interaction

cd $wkdir/reproduce_boeck_wb/wormbase_ontology

#prep wormbase_simplemine.txt : get just seq ids, phenotypes, tissue terms, life stage terms, references, interactions

awk  'BEGIN {FS="\t"} {OFS="\t"} {print "CELEG."$5,$16,$17,$20,$21,$22,$23,$26,$19}' wormbase_simplemine.txt > prep_simplemine_1

#get just phenotypes

awk  'BEGIN {FS="\t"} {OFS="\t"} {print $1,$2,$3}' prep_simplemine_1 > phenotype/phenotype_1

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/phenotype

#remove genes without seq ids

grep -w -v "CELEG.N.A." phenotype_1	> phenotype_2

#remove header

sed -i '1d' phenotype_2

#replace second tab with comma

sed -i -e 's/\t/,/2' phenotype_2 

#replace N.A.,N.A. 

perl -p -i -e 's/\tN\.A\.,N\.A\.//g' phenotype_2
perl -p -i -e 's/,N\.A\.//g' phenotype_2 
perl -p -i -e 's/N\.A\.,//g' phenotype_2 
perl -p -i -e 's/\tN\.A\.//g' phenotype_2 

#count phenotypes

awk -F '[\t,]' '{print $1, NF-1}' phenotype_2 > phenotype_3

#replace tabs

awk -v OFS="\t" '$1=$1' phenotype_3 > phenotypes

#remove temp files

rm phenotype_*




#tissues

cd $wkdir/reproduce_boeck_wb/wormbase_ontology

awk  'BEGIN {FS="\t"} {OFS="\t"} {print $1,$4,$5}' prep_simplemine_1 > tissue/tissue_1

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/tissue

#remove genes without seq ids

grep -w -v "CELEG.N.A." tissue_1	> tissue_2

#remove header

sed -i '1d' tissue_2

#replace second tab with comma

sed -i -e 's/\t/,/2' tissue_2 

#replace N.A.,N.A. 

perl -p -i -e 's/\tN\.A\.,N\.A\.//g' tissue_2
perl -p -i -e 's/,N\.A\.//g' tissue_2 
perl -p -i -e 's/N\.A\.,//g' tissue_2 
perl -p -i -e 's/\tN\.A\.//g' tissue_2 

#count tissues

awk -F '[\t,]' '{print $1, NF-1}' tissue_2 > tissue_3

#replace tabs

awk -v OFS="\t" '$1=$1' tissue_3 > tissues

#remove temp files

rm tissue_*


#life stages


cd $wkdir/reproduce_boeck_wb/wormbase_ontology

awk  'BEGIN {FS="\t"} {OFS="\t"} {print $1,$6,$7}' prep_simplemine_1 > life_stage/life_stage_1

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/life_stage

#remove genes without seq ids

grep -w -v "CELEG.N.A." life_stage_1	> life_stage_2

#remove header

sed -i '1d' life_stage_2

#replace second tab with comma

sed -i -e 's/\t/,/2' life_stage_2 

#replace N.A.,N.A. 

perl -p -i -e 's/\tN\.A\.,N\.A\.//g' life_stage_2
perl -p -i -e 's/,N\.A\.//g' life_stage_2 
perl -p -i -e 's/N\.A\.,//g' life_stage_2 
perl -p -i -e 's/\tN\.A\.//g' life_stage_2 

#count life_stagess

awk -F '[\t,]' '{print $1, NF-1}' life_stage_2 > life_stage_3

#replace tabs

awk -v OFS="\t" '$1=$1' life_stage_3 > life_stages

#remove temp files

rm life_stage_*



#reference count

cd $wkdir/reproduce_boeck_wb/wormbase_ontology


awk  'BEGIN {FS="\t"} {OFS="\t"} {print $1,$8}' prep_simplemine_1 > reference_count/reference_count_1

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/reference_count

#remove genes without seq ids

grep -w -v "CELEG.N.A." reference_count_1	> reference_count_2

#remove header

sed -i '1d' reference_count_2

#replace second tab with comma

sed -i -e 's/\t/,/2' reference_count_2 

#replace N.A.,N.A. 

perl -p -i -e 's/\tN\.A\.,N\.A\.//g' reference_count_2
perl -p -i -e 's/,N\.A\.//g' reference_count_2 
perl -p -i -e 's/N\.A\.,//g' reference_count_2 
perl -p -i -e 's/\tN\.A\.//g' reference_count_2 

#count reference_counts

awk -F '[\t,]' '{print $1, NF-1}' reference_count_2 > reference_count_3

#replace tabs

awk -v OFS="\t" '$1=$1' reference_count_3 > reference_counts

#remove temp files

rm reference_count_*


#interaction

awk  'BEGIN {FS="\t"} {OFS="\t"} {print $1,$9}' prep_simplemine_1 > interaction/interaction_1

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/interaction

#remove genes without seq ids

grep -w -v "CELEG.N.A." interaction_1	> interaction_2

#remove header

sed -i '1d' interaction_2

#replace second tab with comma

sed -i -e 's/\t/,/2' interaction_2 

#replace N.A.,N.A. 

perl -p -i -e 's/\tN\.A\.,N\.A\.//g' interaction_2
perl -p -i -e 's/,N\.A\.//g' interaction_2 
perl -p -i -e 's/N\.A\.,//g' interaction_2 
perl -p -i -e 's/\tN\.A\.//g' interaction_2 

#count interactions

awk -F '[\t,]' '{print $1, NF-1}' interaction_2 > interaction_3

#replace tabs

awk -v OFS="\t" '$1=$1' interaction_3 > interactions

#remove temp files

rm interaction_*



#next pfam domains

	#elegans domain file is elegans_domains.txt
	

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/pfam_domain

#replace space with tab

perl -p -i -e 's/ /\t/g' elegans_domains

#get rid of lower case

sed -i -e 's/[a-z]\t/\t/g' elegans_domains
sed -i -e 's/[a-z]\t/\t/g' elegans_domains

#for R script on my machine, need: module load easybuild GCC/6.3.0-2.27

#get domain counts with R script , domain_counts.R

Rscript $wkdir/scripts/domain_counts.R elegans_domains

# need script merge.pl  which can be found at https://github.com/religa/stats/blob/master/merge

#get just protein coding genes

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/life_stage/


LC_ALL=C fgrep -w -f $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes/elegans_prot_list life_stages > life_stage_grep &


cd $wkdir/reproduce_boeck_wb/wormbase_ontology/phenotype/

LC_ALL=C fgrep -w -f $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes/elegans_prot_list phenotypes > phenotype_grep

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/tissue/

LC_ALL=C fgrep -w -f $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes/elegans_prot_list tissues > tissue_grep

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/reference_count/

LC_ALL=C fgrep -w -f $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes/elegans_prot_list reference_counts > reference_count_grep

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/interaction/

LC_ALL=C fgrep -w -f $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes/elegans_prot_list interactions > interaction_grep


#merge sets...

#this requires merge.pl which can be found at https://github.com/religa/stats/blob/master/merge

cd $wkdir/reproduce_boeck_wb/wormbase_ontology/

#gene_id	1	all_lost	elegans_lost	sp34_lost	domain	life_stage	phenotype	reference_count	tissue

perl $wkdir/scripts/merge.pl -k -e "0" $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes/elegans_prot_list_ones $wkdir/reproduce_boeck_wb/lost_genes_list/all_caeno_lost_ones $wkdir/reproduce_boeck_wb/lost_genes_list/elegans_group_lost_ones $wkdir/reproduce_boeck_wb/lost_genes_list/sp34_lost_ones pfam_domain/elegans_domain_counts life_stage/life_stage_grep phenotype/phenotype_grep reference_count/reference_count_grep tissue/tissue_grep interaction/interaction_grep 2> merge_pl_error_output > wormbase_ontology_counts_tmp &

#three genes have duplicate sequence id's for legacy WormBase and meaningful genetic (i.e., shared promoter in the case of CELEG.ZC416.8) reasons-- these are being removed from the analysis

echo -e "CELEG.Y105E8A.7\nCELEG.ZC416.8\nCELEG.B0564.1" > duplicate_gene_ids

LC_ALL=C fgrep -w -v -f duplicate_gene_ids wormbase_ontology_counts_tmp > wormbase_ontology_counts

echo -e "gene_id\t1\tall_lost\telegans_lost\tsp34_lost\tdomain\tlife_stage\tphenotype\treference_count\ttissue\tinteraction" | cat - wormbase_ontology_counts > wormbase_ontology_counts_tmp

mv wormbase_ontology_counts_tmp wormbase_ontology_counts


#ok, now the boeck et al. data set

#get the original data

mkdir  $wkdir/reproduce_boeck_wb/boeck/

mkdir  $wkdir/reproduce_boeck_wb/boeck/original_data

cd $wkdir/reproduce_boeck_wb/boeck/original_data

#this is a guide to the columns
wget https://genome.cshlp.org/content/suppl/2016/09/20/gr.202663.115.DC1/Supplemental_Table_S1.xlsx

#this is the RNAseq data in read counts and dcpm
wget https://genome.cshlp.org/content/suppl/2016/09/20/gr.202663.115.DC1/Supplemental_Table_S2.gz

##get boeck data ready

mkdir  $wkdir/reproduce_boeck_wb/boeck/prep_data

cd  $wkdir/reproduce_boeck_wb/boeck/prep_data

cd $wkdir/reproduce_boeck_wb/boeck/original_data

#make tab delimited

perl -p -e 's/ /\t/g' Supplemental_Table_S2 > $wkdir/reproduce_boeck_wb/boeck/prep_data/boeck_data.tmp

#get only the columns I want.

	#here, this design is seemingly unbalanced with postembryonic stages analyzed with polyA preps and embryonic stages analyzed with both polyA and total RNA preps. However, only the total RNA measures appear to have any replication. So, for this, I will use the total RNA embryonic samples and the postembryonic polyA samples to get some replication but not average across different kinds of preps within developmental stages. Also, will only be looking at dpcm.

cd $wkdir/reproduce_boeck_wb/boeck/prep_data/


awk  'BEGIN {FS="\t"} {OFS="\t"} {print $1, $5, $47, $49, $51, $53, $55, $57, $59, $61, $63, $65, $67, $69, $71, $73, $75, $77, $79, $81, $83, $85, $87, $89, $91, $93, $95, $97, $99, $101, $103, $105, $107, $109, $111, $113, $115, $117, $119, $121, $123, $125, $127, $129, $131, $133, $135, $137, $139, $141, $143, $145, $147, $149, $151, $153, $155, $157, $159, $161, $163, $165, $167, $169, $171, $173, $175, $177, $179, $181, $183, $185}' boeck_data.tmp > boeck_data.tmp_2


#what are the column headers: head -1 boeck_data.tmp_2 | perl -p -e 's/\t/\n/g'

#I want to average replicates. Here is how the data are organized.

#before_averaging				after_averaging	
#WormbaseName	1			gene_id	$1
#N2_4cell_EE_RZ-56_dcpm	2			EMB_0	(($2+$24)/2)
#20120223_EMB-0_dcpm	3			4_cell	$3
#20120223_EMB-30_dcpm	4			EMB_30	(($4+$34)/2)
#20120223_EMB-60_dcpm	5			EMB_60	(($5+$25)/2)
#20120223_EMB-90_dcpm	6			EMB_90	(($6+$26+$35)/3)
#20120223_EMB-120_dcpm	7			EMB_120	(($7+$27+$36)/3)
#20120223_EMB-150_dcpm	8			EMB_150	(($8+$28+$37)/3)
#20120223_EMB-180_dcpm	9			EMB_180	(($9+$29+$38)/3)
#20120223_EMB-210_dcpm	10			EMB_210	$10
#20120223_EMB-240_dcpm	11			EMB_240	(($11+$30+$39)/3)
#20120223_EMB-270_dcpm	12			EMB_270	(($12+$40)/2)
#20120223_EMB-300_dcpm	13			EMB_300	(($13+$31+$41)/3)
#20120223_EMB-330_dcpm	14			EMB_330	(($14+$42)/2)
#20120223_EMB-360_dcpm	15			EMB_360	(($15+$32+$43)/3)
#20120223_EMB-390_dcpm	16			EMB_390	$16
#20120223_EMB-420_dcpm	17			EMB_420	(($17+$44)/2)
#20120223_EMB-450_dcpm	18			EMB_450	(($18+$45)/2)
#20120223_EMB-480_dcpm	19			EMB_480	$19
#20120223_EMB-510_dcpm	20			EMB_510	$20
#20120223_EMB-540_dcpm	21			EMB_540	$21
#20120223_EMB-570_dcpm	22			EMB_570	$22
#20120223_EMB-600_dcpm	23			EMB_600	(($23+$33)/2)
#20120411_EMB-0_dcpm	24			L1	(($46+$47)/2)
#20120411_EMB-60_dcpm	25			L2	(($48+$49)/2)
#20120411_EMB-90_dcpm	26			L3	(($50+$51)/2)
#20120411_EMB-120_dcpm	27			L4_her	(($65+$66)/2)
#20120411_EMB-150_dcpm	28			young_adult_her	(($69+$70)/2)
#20120411_EMB-180_dcpm	29			old_adult_her	$71
#20120411_EMB-240_dcpm	30			male	(($63+$64)/2)
#20120411_EMB-300_dcpm	31			adult_soma_her	(($67+$68)/2)
#20120411_EMB-360_dcpm	32			adult_gonad_her	$72
#20120411_EMB-600_dcpm	33			dauer_entry	(($56+$57+$58+$59)/4)
#20120419_EMB-30_dcpm	34			dauer	(($52+$53+$54+$55)/4)
#20120419_EMB-90_dcpm	35			dauer_exit	(($60+$61+$62)/3)
#20120419_EMB-120_dcpm	36				
#20120419_EMB-150_dcpm	37				
#20120419_EMB-180_dcpm	38				
#20120419_EMB-240_dcpm	39				
#20120419_EMB-270_dcpm	40				
#20120419_EMB-300_dcpm	41				
#20120419_EMB-330_dcpm	42				
#20120419_EMB-360_dcpm	43				
#20120419_EMB-420_dcpm	44				
#20120419_EMB-450_dcpm	45				
#L1_dcpm	46				
#N2_L1-1_dcpm	47				
#L2_dcpm	48				
#N2_L2-4_dcpm	49				
#L3_dcpm	50				
#N2_L3-1_dcpm	51				
#DauerDAF2_dcpm	52				
#DauerDAF2-2_dcpm	53				
#DauerDAF2-2-1_dcpm	54				
#DauerDAF2-5-1_dcpm	55				
#DauerEntryDAF2_dcpm	56				
#DauerEntryDAF2-1-1_dcpm	57				
#DauerEntryDAF2-2_dcpm	58				
#DauerEntryDAF2-4-1_dcpm	59				
#DauerExitDAF2-2_dcpm	60				
#DauerExitDAF2-3-1_dcpm	61				
#DauerExitDAF2-6-1_dcpm	62				
#L4MALE_dcpm	63				
#L4MALE5_dcpm	64				
#L4_dcpm	65				
#L4b_dcpm	66				
#L4JK1107soma_dcpm	67				
#L4JK1107soma-2_dcpm	68				
#YA_dcpm	69				
#N2_Yad-1_dcpm	70				
#AdultSPE9_dcpm	71				
#N2_Ad_gonad-1-RZLI_dcpm	72				

#to get the data in a format with samples averaged....

#columns will be:

#gene_id	EMB_0	4_cell	EMB_30	EMB_60	EMB_90	EMB_120	EMB_150	EMB_180	EMB_210	EMB_240	EMB_270	EMB_300	EMB_330	EMB_360	EMB_390	EMB_420	EMB_450	EMB_480	EMB_510	EMB_540	EMB_570	EMB_600	L1	L2	L3	L4_her	young_adult_her	old_adult_her	male	adult_soma_her	adult_gonad_her	dauer_entry	dauer	dauer_exit

awk  'BEGIN {FS="\t"} {OFS="\t"} {print "CELEG."$1, (($2+$24)/2), $3, (($4+$34)/2), (($5+$25)/2), (($6+$26+$35)/3), (($7+$27+$36)/3), (($8+$28+$37)/3), (($9+$29+$38)/3), $10, (($11+$30+$39)/3), (($12+$40)/2), (($13+$31+$41)/3), (($14+$42)/2), (($15+$32+$43)/3), $16, (($17+$44)/2), (($18+$45)/2), $19, $20, $21, $22, (($23+$33)/2), (($46+$47)/2), (($48+$49)/2), (($50+$51)/2), (($65+$66)/2), (($69+$70)/2), $71, (($63+$64)/2), (($67+$68)/2), $72, (($56+$57+$58+$59)/4), (($52+$53+$54+$55)/4), (($60+$61+$62)/3)}' boeck_data.tmp_2 > boeck_data.tmp_3

#should have 35 columns
# awk -F '\t' '{print NF; exit}' boeck_data.tmp_3
# checks out

#remove header that is now junk

sed -i '1d' boeck_data.tmp_3

#add new header

echo -e "gene_id\tEMB_0\t4_cell\tEMB_30\tEMB_60\tEMB_90\tEMB_120\tEMB_150\tEMB_180\tEMB_210\tEMB_240\tEMB_270\tEMB_300\tEMB_330\tEMB_360\tEMB_390\tEMB_420\tEMB_450\tEMB_480\tEMB_510\tEMB_540\tEMB_570\tEMB_600\tL1\tL2\tL3\tL4_her\tyoung_adult_her\told_adult_her\tmale\tadult_soma_her\tadult_gonad_her\tdauer_entry\tdauer\tdauer_exit" | cat - boeck_data.tmp_3 > boeck_data

#merge lost gene/wormbase/pfam and boeck data

#this requires merge.pl	which can be found at https://github.com/religa/stats/blob/master/merge

cd $wkdir/reproduce_boeck_wb

perl $wkdir/scripts/merge.pl -k -e "0" $wkdir/reproduce_boeck_wb/elegans_protein_coding_genes/elegans_prot_list_ones $wkdir/reproduce_boeck_wb/lost_genes_list/elegans_constituents_of_lost_og_all_caeno $wkdir/reproduce_boeck_wb/lost_genes_list/elegans_constituents_of_lost_og_elegans_group $wkdir/reproduce_boeck_wb/lost_genes_list/elegans_constituents_of_lost_og_sp34 pfam_domain/elegans_domain_counts life_stage/life_stage_grep phenotype/phenotype_grep reference_count/reference_count_grep tissue/tissue_grep interaction/interaction_grep 2> merge_pl_error_output_2 > wormbase_ontology_counts_tmp &

#three genes have duplicate sequence id's for legacy WormBase and meaningful genetic (i.e., shared promoter in the case of CELEG.ZC416.8) reasons-- these are being removed from the analysis

LC_ALL=C fgrep -w -v -f duplicate_gene_ids wormbase_ontology_counts_tmp > wormbase_ontology_counts

echo -e "gene_id\t1\tall_lost\telegans_lost\tsp34_lost\tdomain\tlife_stage\tphenotype\treference_count\ttissue\tinteraction" | cat - wormbase_ontology_counts > wormbase_ontology_counts_tmp

mv wormbase_ontology_counts_tmp wormbase_ontology_counts


#merge lost gene/wormbase/pfam and boeck data

cd $wkdir/reproduce_boeck_wb

perl $wkdir/scripts/merge.pl -k -e "0" wormbase_ontology/wormbase_ontology_counts boeck/prep_data/boeck_data 2> merge_pl_error_output_2 > lost_gene_wormbase_boeck_data_tmp &

#remove genes not in the elegans protein-coding gene set retreived for this study

awk '$2 == "1" {print $0}' lost_gene_wormbase_boeck_data_tmp > lost_gene_wormbase_boeck_data
#remove genes with no lost gene, wormbase, or expression information

awk -F'\t' 'NF==45 {print}' lost_gene_wormbase_boeck_data > lost_gene_wormbase_boeck_data_tmp
mv lost_gene_wormbase_boeck_data_tmp lost_gene_wormbase_boeck_data

