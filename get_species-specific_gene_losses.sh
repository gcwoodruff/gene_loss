#set working directory

wkdir="/projects/phillipslab/gavincw/reproducing_lost_genes_1-22-19/lost_genes_post_of"

# "Orthogroups_star.csv" is nearly identical to "Orthogroups.csv" file made by OrthoFinder, but has an additional, filler column with all rows containing the same value ("*")

#with respect to all Caenorhabditis

awk 'BEGIN {FS="\t"} $3 == "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/afra
awk 'BEGIN {FS="\t"} $3 != "" && $4 == "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/angaria
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 == "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/brenneri
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 == "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/briggsae
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 == "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/castelli
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 == "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/doughertyi
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 == "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/elegans
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 == "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/japonica
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 == "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/kamaaina
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 == "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/latens
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 == "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/monodelphis
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 == "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/nigoni
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 == "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/plicata
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 == "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/remanei
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 == "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sinica
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 == "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp21
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 == "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp26
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 == "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp28
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 == "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp29
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 == "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp31
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 == "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp32
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 == "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp34
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 == "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp38
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 == "" && $27 != "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp39
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 == "" && $28 != "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/sp40
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 == "" && $29 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/tropicalis
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 == "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/virilis
awk 'BEGIN {FS="\t"} $3 != "" && $4 != "" && $5 != "" && $6 != "" && $7 != "" && $8 != "" && $9 != "" && $10 != "" && $11 != "" && $12 != "" && $13 != "" && $14 != "" && $15 != "" && $16 != "" && $17 != "" && $18 != "" && $19 != "" && $20 != "" && $21 != "" && $22 != "" && $23 != "" && $24 != "" && $25 != "" && $26 != "" && $27 != "" && $28 != "" && $29 != "" && $30 == "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/all_caeno/wallacei


#with respect to the elegans group

awk 'BEGIN {FS="\t"} $5 == "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/brenneri
awk 'BEGIN {FS="\t"} $5 != "" && $6 == "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/briggsae
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 == "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/doughertyi
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 == "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/elegans
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 == "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/kamaaina
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 == "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/latens
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 == "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/nigoni
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 == "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/remanei
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 == "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/sinica
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 == "" && $24 != "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/sp26
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 == "" && $27 != "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/sp34
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 == "" && $28 != "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/sp40
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 == "" && $30 != "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/tropicalis
awk 'BEGIN {FS="\t"} $5 != "" && $6 != "" && $8 != "" && $9 != "" && $11 != "" && $12 != "" && $14 != "" && $16 != "" && $17 != "" && $19 != "" && $24 != "" && $27 != "" && $28 != "" && $30 == "" && $31 != "" {print} ' $wkdir/00_orthofinder_results/Orthogroups_star.csv > $wkdir/01_species-specific_orthogroup_losses/elegans_group/wallacei

#get the C. elegans constituents of lost orthogroups ; this is before any filtering for best reciprocal blastp hits and tblastn hits outside of predicted coding regions

mkdir $wkdir/02_elegans_constituents_of_lost_orthogroups/
mkdir $wkdir/02_elegans_constituents_of_lost_orthogroups/all_caeno/
mkdir $wkdir/02_elegans_constituents_of_lost_orthogroups/elegans_group/

cd $wkdir/01_species-specific_orthogroup_losses/all_caeno/

for i in *; do awk 'BEGIN {FS="\t"} {OFS="\t"} {print $9}' $i > $wkdir/02_elegans_constituents_of_lost_orthogroups/all_caeno/$i; done

cd $wkdir/01_species-specific_orthogroup_losses/elegans_group/

for i in *; do awk 'BEGIN {FS="\t"} {OFS="\t"} {print $9}' $i > $wkdir/02_elegans_constituents_of_lost_orthogroups/elegans_group/$i; done


#replace commas with returns, remove empty line...

cd $wkdir/02_elegans_constituents_of_lost_orthogroups/all_caeno/
for i in *; do sed -i -E 's/,\s/\n/g' $i; done
for i in *; do sed -i -e '/^$/d' $i; done

cd $wkdir/02_elegans_constituents_of_lost_orthogroups/elegans_group/
for i in *; do sed -i -E 's/,\s/\n/g' $i; done
for i in *; do sed -i -e '/^$/d' $i; done



#now, retreive the best reciprocal blastp hits generated by OrthoFinder with script reciprocal_blast_hits.py.

mkdir $wkdir/03_reciprocal_blast_hits/

#what are the species numbers?
#0: D_coronatus.fa
#1: afra.fa
#2: angaria.fa
#3: brenneri.fa
#4: briggsae.fa
#5: castelli.fa
#6: doughertyi.fa
#7: elegans.fa
#8: japonica.fa
#9: kamaaina.fa
#10: latens.fa
#11: monodelphis.fa
#12: nigoni.fa
#13: plicata.fa
#14: remanei.fa
#15: sinica.fa
#16: sp21.fa
#17: sp26.fa
#18: sp28.fa
#19: sp29.fa
#20: sp31.fa
#21: sp32.fa
#22: sp34.fa
#23: sp38.fa
#24: sp39.fa
#25: sp40.fa
#26: tropicalis.fa
#27: virilis.fa
#28: wallacei.fa

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_1.txt $wkdir/00_orthofinder_results/Blast1_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/afra

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_2.txt $wkdir/00_orthofinder_results/Blast2_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/angaria

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_3.txt $wkdir/00_orthofinder_results/Blast3_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/brenneri

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_4.txt $wkdir/00_orthofinder_results/Blast4_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/briggsae

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_5.txt $wkdir/00_orthofinder_results/Blast5_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/castelli

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_6.txt $wkdir/00_orthofinder_results/Blast6_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/doughertyi

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_7.txt $wkdir/00_orthofinder_results/Blast7_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/elegans

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_8.txt $wkdir/00_orthofinder_results/Blast8_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/japonica

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_9.txt $wkdir/00_orthofinder_results/Blast9_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/kamaaina

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_10.txt $wkdir/00_orthofinder_results/Blast10_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/latens

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_11.txt $wkdir/00_orthofinder_results/Blast11_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/monodelphis

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_12.txt $wkdir/00_orthofinder_results/Blast12_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/nigoni

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_12.txt $wkdir/00_orthofinder_results/Blast12_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/nigoni

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_13.txt $wkdir/00_orthofinder_results/Blast13_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/plicata

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_14.txt $wkdir/00_orthofinder_results/Blast14_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/remanei

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_15.txt $wkdir/00_orthofinder_results/Blast15_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sinica

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_16.txt $wkdir/00_orthofinder_results/Blast16_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp21

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_17.txt $wkdir/00_orthofinder_results/Blast17_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp26

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_18.txt $wkdir/00_orthofinder_results/Blast18_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp28

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_19.txt $wkdir/00_orthofinder_results/Blast19_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp29

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_20.txt $wkdir/00_orthofinder_results/Blast20_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp31

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_21.txt $wkdir/00_orthofinder_results/Blast21_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp32

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_22.txt $wkdir/00_orthofinder_results/Blast22_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp34

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_23.txt $wkdir/00_orthofinder_results/Blast23_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp38

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_24.txt $wkdir/00_orthofinder_results/Blast24_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp39

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_25.txt $wkdir/00_orthofinder_results/Blast25_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/sp40

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_26.txt $wkdir/00_orthofinder_results/Blast26_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/tropicalis

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_27.txt $wkdir/00_orthofinder_results/Blast27_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/virilis

python reciprocal_blast_hits.py $wkdir/00_orthofinder_results/Blast7_28.txt $wkdir/00_orthofinder_results/Blast28_7.txt 1 2 12 high $wkdir/03_reciprocal_blast_hits/wallacei

#now, add the real sequence id's...

#run replace_seq_ids.sh

cd $wkdir/03_reciprocal_blast_hits/
for i in *; do ./replace_seq_ids.sh; done

#now, use to filter_tblastn_hits.sh to filter out tblastn hits that fall outside of predicted coding regions.
