#set working directory

wkdir="$wkdir//"

#rename protein sets

mv Caenorhabditis_afra_JU1286_v1.proteins.fa afra.fa
mv caenorhabditis_angaria.PRJNA51225.WBPS9.protein.fa angaria.fa
mv caenorhabditis_brenneri.PRJNA20035.WBPS9.protein.fa brenneri.fa
mv caenorhabditis_briggsae.PRJNA10731.WBPS9.protein.fa briggsae.fa
mv Caenorhabditis_castelli_JU1956_v1.proteins.fa castelli.fa
mv Caenorhabditis_doughertyi_JU1771_v1.proteins.fa doughertyi.fa
mv caenorhabditis_elegans.PRJNA13758.WBPS9.protein.fa elegans.fa
mv caenorhabditis_japonica.PRJNA12591.WBPS9.protein.fa japonica.fa
mv Caenorhabditis_kamaaina_QG2077_v1.proteins.fa kamaaina.fa
mv Caenorhabditis_latens_PX534_v1.proteins.fa latens.fa
mv Caenorhabditis_monodelphis_JU1667_v1.proteins.fa monodelphis.fa
mv Caenorhabditis_plicata_SB355_v1.proteins.fa plicata.fa
mv Caenorhabditis_remanei_PX439_v1.proteins.fa.gz remanei.fa
mv caenorhabditis_sinica.PRJNA194557.WBPS9.protein.fa sinica.fa
mv Caenorhabditis_sp21_NIC534_v1.proteins.fa sp21.fa
mv Caenorhabditis_sp26_JU2190_v1.proteins.fa sp26.fa
mv Caenorhabditis_sp28_QG2080_v1.proteins.fa sp28.fa
mv Caenorhabditis_sp29_QG2083_v1.proteins.fa sp29.fa
mv Caenorhabditis_sp31_JU2585_v1.scaffolds.fa sp31.fa
mv Caenorhabditis_sp32_JU2788_v1.proteins.fa sp32.fa
mv Caenorhabditis_sp34_NK74SC_v710.proteins.fa sp34.fa
mv Caenorhabditis_sp38_JU2809_v1.proteins.fa sp38.fa
mv Caenorhabditis_sp39_NIC564_v1.proteins.fa sp39.fa
mv Caenorhabditis_sp40_JU2818_v1.proteins.fa sp40.fa
mv caenorhabditis_tropicalis.PRJNA53597.WBPS9.protein.fa tropicalis.fa
mv Caenorhabditis_virilis_JU1968_v1.proteins.fa virilis.fa
mv Diploscapter_coronatus_PDL0010_v1.proteins.fa D_coronatus.fa
mv nigoni.pc_gen.vs.nigoni_cDNA_2016.11.02.complete.pep.fa nigoni.fa
mv wallacei_gen.vs.wallacei_cDNA_2016.11.02.complete.pep.fa wallacei.fa

#remove all stuff after main gene id

mkdir $wkdir/02_prep_canonical_protein/

for i in *; do sed -e 's/\s.*$//g' > $wkdir/02_prep_canonical_protein/$i; done

#for spcies that do not have it, add a common species identifier to the beginning of each protein

cd $wkdir/02_prep_canonical_protein/

sed -i -e 's/>/>CANGA./g' angaria.fa
sed -i -e 's/>/>CBREN./g' brenneri.fa
sed -i -e 's/>/>CBRIG./g' briggsae.fa
sed -i -e 's/>/>CELEG./g' elegans.fa
sed -i -e 's/>/>CJAPO./g' japonica.fa
sed -i -e 's/>/>CINGO./g' nigoni.fa
sed -i -e 's/>/>CSINI./g' sinica.fa
sed -i -e 's/>/>CTROP./g' tropicalis.fa
sed -i -e 's/>/>CWALL./g' wallacei.fa

#get the longest alternative splice variant for a canonical protein set

mkdir $wkdir/02_prep_canonical_protein/

python canonical_filter_t.py afra.fa > $wkdir/03_canonical_protein_fasta/afra.fa
python canonical_filter_t.py angaria.fa > $wkdir//03_canonical_protein_fasta/angaria.fa
python canonical_filter_elegans.py brenneri.fa > $wkdir//03_canonical_protein_fasta/brenneri.fa
python canonical_filter_elegans.py briggsae.fa > $wkdir//03_canonical_protein_fasta/briggsae.fa
python canonical_filter_t.py castelli.fa > $wkdir//03_canonical_protein_fasta/castelli.fa
python canonical_filter_t.py doughertyi.fa > $wkdir//03_canonical_protein_fasta/doughertyi.fa
python canonical_filter_elegans.py elegans.fa > $wkdir//03_canonical_protein_fasta/elegans.fa
python canonical_filter_elegans.py japonica.fa > $wkdir//03_canonical_protein_fasta/japonica.fa
python canonical_filter_t.py kamaaina.fa > $wkdir//03_canonical_protein_fasta/kamaaina.fa
python canonical_filter_remanei-latens.py latens.fa > $wkdir//03_canonical_protein_fasta/latens.fa
python canonical_filter_t.py monodelphis.fa > $wkdir//03_canonical_protein_fasta/monodelphis.fa
python canonical_filter_t.py nigoni.fa > $wkdir//03_canonical_protein_fasta/nigoni.fa
python canonical_filter_t.py plicata.fa > $wkdir//03_canonical_protein_fasta/plicata.fa
python canonical_filter_remanei-latens.py remanei.fa > $wkdir//03_canonical_protein_fasta/remanei.fa
python canonical_filter_t.py sinica.fa > $wkdir//03_canonical_protein_fasta/sinica.fa
python canonical_filter_t.py sp21.fa > $wkdir//03_canonical_protein_fasta/sp21.fa
python canonical_filter_t.py sp26.fa > $wkdir//03_canonical_protein_fasta/sp26.fa
python canonical_filter_t.py sp28.fa > $wkdir//03_canonical_protein_fasta/sp28.fa
python canonical_filter_t.py sp29.fa > $wkdir//03_canonical_protein_fasta/sp29.fa
python canonical_filter_t.py sp31.fa > $wkdir//03_canonical_protein_fasta/sp31.fa
python canonical_filter_t.py sp32.fa > $wkdir//03_canonical_protein_fasta/sp32.fa
python canonical_filter_t.py sp34.fa > $wkdir//03_canonical_protein_fasta/sp34.fa
python canonical_filter_t.py sp38.fa > $wkdir//03_canonical_protein_fasta/sp38.fa
python canonical_filter_t.py sp39.fa > $wkdir//03_canonical_protein_fasta/sp39.fa
python canonical_filter_t.py sp40.fa > $wkdir//03_canonical_protein_fasta/sp40.fa
python canonical_filter_t.py tropicalis.fa > $wkdir//03_canonical_protein_fasta/tropicalis.fa
python canonical_filter_t.py virilis.fa > $wkdir//03_canonical_protein_fasta/virilis.fa
python canonical_filter_t.py wallacei.fa > $wkdir//03_canonical_protein_fasta/wallacei.fa

#link D_coronatus

ln -s $wkdir//02_prep_canonical_protein/D_coronatus.fa $wkdir//03_canonical_protein_fasta/D_coronatus.fa
