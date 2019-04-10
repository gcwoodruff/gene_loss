library(ggplot2)
library(ggforce)

dat <- read.table("genome_statistics.tsv", sep="\t", header=T)

#re-order species somewhat phylogenetically

dat$species <- factor(dat$species, levels = c("latens","remanei","briggsae","nigoni","sp26","sp40","sinica","tropicalis","wallacei","doughertyi","brenneri","sp34","elegans","kamaaina","sp28","sp39","sp29","sp32","afra","japonica","sp31","castelli","angaria","sp38","virilis","plicata","sp21","monodelphis"))


#make species and category labels

latens <- expression(paste(italic("C. latens")))
remanei <- expression(paste(italic("C. remanei")))
briggsae <- expression(paste(italic("C. briggsae")))
nigoni <- expression(paste(italic("C. nigoni")))
sp26 <- expression(paste(italic("C. zanzibari")))
sp40 <- expression(paste(italic("C. tribulationis")))
sinica <- expression(paste(italic("C. sinica")))
tropicalis <- expression(paste(italic("C. tropicalis")))
wallacei <- expression(paste(italic("C. wallacei")))
doughertyi <- expression(paste(italic("C. doughertyi")))
brenneri <- expression(paste(italic("C. brenneri")))
inopinata <- expression(paste(italic("C. inopinata")))
elegans <- expression(paste(italic("C. elegans")))
kamaaina <- expression(paste(italic("C. kamaaina")))
sp28 <- expression(paste(italic("C. panamensis")))
sp39 <- expression(paste(italic("C. waitukubuli")))
sp29 <- expression(paste(italic("C. becei")))
sp32 <- expression(paste(italic("C. sulstoni")))
afra <- expression(paste(italic("C. afra")))
japonica <- expression(paste(italic("C. japonica")))
sp31 <- expression(paste(italic("C. uteleia")))
castelli <- expression(paste(italic("C. castelli")))
angaria <- expression(paste(italic("C. angaria")))
sp38 <- expression(paste(italic("C. quiockensis")))
virilis <- expression(paste(italic("C. virilis")))
plicata <- expression(paste(italic("C. plicata")))
sp21 <- expression(paste(italic("C. parvicauda")))
monodelphis <- expression(paste(italic("C. monodelphis")))


species_labels <- c(latens,remanei,briggsae,nigoni,sp26,sp40,sinica,tropicalis,wallacei,doughertyi,brenneri,inopinata,elegans,kamaaina,sp28,sp39,sp29,sp32,afra,japonica,sp31,castelli,angaria,sp38,virilis,plicata,sp21,monodelphis)

dat$assembly.size.MB <- dat$assembly.size/1000000

dat_all <- dat[dat$group == "all",]

a <- ggplot(dat_all,aes(x=species, y=assembly.size.MB)) + geom_bar(stat="identity",aes(fill=rep.mode)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", angle = 45, hjust =1, size=10), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=12,face="plain"), strip.background = element_rect(colour="white", fill="white"), legend.position = "none") + xlab("Species") + ylab("Assembly size (MB)")+ scale_fill_brewer(name = "Reproductive mode", labels = c("Female/male", "Hermaphroditic")) + scale_x_discrete(labels = species_labels) + ylim(0,200)


ggsave("assembly_size.pdf", width=6, height=3.5, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("assembly_size.png", width=6, height=3.5, units = "in",type="cairo-png")
print(a)
dev.off

a <- ggplot(dat_all,aes(x=species, y=number.of.genes)) + geom_bar(stat="identity",aes(fill=rep.mode)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", angle = 45, hjust =1, size=10), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=12,face="plain"), strip.background = element_rect(colour="white", fill="white"), legend.position = "none") + xlab("Species") + ylab("Number of genes")+ scale_fill_brewer(name = "Reproductive mode", labels = c("Female/male", "Hermaphroditic")) + scale_x_discrete(labels = species_labels) + scale_y_continuous(breaks = c(0,5000,10000,15000,20000,25000,30000,35000), limits=c(0,35000))


ggsave("gene_number.pdf", width=6, height=3.5, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("gene_number.png", width=6, height=3.5, units = "in",type="cairo-png")
print(a)
dev.off

a <- ggplot(dat_all,aes(x=species, y=number.of.scaffolds)) + geom_bar(stat="identity",aes(fill=rep.mode)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", angle = 45, hjust =1, size=10), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=12,face="plain"), strip.background = element_rect(colour="white", fill="white"), legend.position = "none") + xlab("Species") + ylab("Number of scaffolds")+ scale_fill_brewer(name = "Reproductive mode", labels = c("Female/male", "Hermaphroditic")) + scale_x_discrete(labels = species_labels) + scale_y_continuous(breaks = c(0,5000,10000,15000,20000,25000,30000,35000), limits=c(0,35000))


ggsave("number_of_scaffolds.pdf", width=6, height=3.5, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("number_of_scaffolds.png", width=6, height=3.5, units = "in", type="cairo-png")
print(a)
dev.off


dat_all$n50.kB <- dat_all$n50/1000


a <- ggplot(dat_all,aes(x=species, y=n50.kB)) + geom_bar(stat="identity",aes(fill=rep.mode)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", angle = 45, hjust =1, size=10), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=12,face="plain"), strip.background = element_rect(colour="white", fill="white"), legend.position = "none") + xlab("Species") + ylab("N50 (kb)")+ scale_fill_brewer(name = "Reproductive mode", labels = c("Female/male", "Hermaphroditic")) + scale_x_discrete(labels = species_labels) + scale_y_continuous(breaks = c(0,5000,10000,15000,20000,25000), limits=c(0,25000))


ggsave("n50.pdf", width=6, height=3.5, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("n50.png", width=6, height=3.5, units = "in", type="cairo-png")
print(a)
dev.off

a <- ggplot(dat_all,aes(x=species, y=busco.completeness)) + geom_bar(stat="identity",aes(fill=rep.mode)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", angle = 45, hjust =1, size=10), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=12,face="plain"), strip.background = element_rect(colour="white", fill="white"), legend.position = "none") + xlab("Species") + ylab("BUSCO completeness score (%)")+ scale_fill_brewer(name = "Reproductive mode", labels = c("Female/male", "Hermaphroditic")) + scale_x_discrete(labels = species_labels) + scale_y_continuous(breaks = c(0,25,50,75,100), limits=c(0,100))

ggsave("busco_completeness.pdf", width=6, height=3.5, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("busco_completeness.png", width=6, height=3.5, units = "in",type="cairo-png")
print(a)
dev.off

#sina plot for lost orthogroups

all_caeno_category <- expression(paste("All ", italic("Caenorhabditis")))

elegans_group_category <- expression(paste(italic("Elegans"), " group"))

a <- ggplot(dat,aes(x=group, y=lost.orthogroups)) + geom_sina(size = 1,alpha=0.5,method ="d") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black"), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=12,face="plain"), strip.background = element_rect(colour="white", fill="white"), legend.position = "none") + xlab("Phylogenetic scope") + ylab("Number of lost orthologous groups")+ scale_fill_brewer() + scale_colour_brewer() + scale_x_discrete(labels = c(all_caeno_category,elegans_group_category)) + scale_y_continuous(breaks = c(0,100,200,300,400,500,600), limits=c(0,600))


ggsave("orthogroup_phylo_scope_sina.pdf", width=3.5, height=6, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("orthogroup_phylo_scope_sina.png", width=3.5, height=6, units = "in",type="cairo-png")
print(a)
dev.off

#scatterplots and linear models

dat_elegans <- dat[dat$group == "elegans",]

dat_elegans$n50.kB <- dat_elegans$n50/1000

	##busco completeness

		##all caeno

a <- ggplot(dat_all, aes(x=busco.completeness,y=lost.orthogroups)) + geom_point() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", size=15), axis.text.y = element_text(colour="black", size=15),axis.title=element_text(size=20),legend.position="none") + xlab("BUSCO completeness score (%)") + ylab("Number of Lost Orthogroups") + scale_x_continuous(limits = c(0,100))

ggsave("busco_v_lost_og_all_caeno.pdf", width=6, height=6, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("busco_v_lost_og_all_caeno.png", width=6, height=6, units = "in",type="cairo-png")
print(a)
dev.off


#lm
summary(lm(lost.orthogroups ~ busco.completeness, dat_all))


	##busco completeness

		##elegans group

a <- ggplot(dat_elegans, aes(x=busco.completeness,y=lost.orthogroups)) + geom_point() + stat_smooth(method = "lm",colour="black",se = FALSE,size =0.5) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", size=15), axis.text.y = element_text(colour="black", size=15),axis.title=element_text(size=20),legend.position="none") + xlab("BUSCO completeness score (%)") + ylab("Number of Lost Orthogroups") + scale_x_continuous(limits = c(0,100))

ggsave("busco_v_lost_og_elegans_group.pdf", width=6, height=6, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("busco_v_lost_og_elegans_group.png", width=6, height=6, units = "in",type="cairo-png")
print(a)
dev.off


#lm
summary(lm(lost.orthogroups ~ busco.completeness, dat_elegans))



	##number of scaffolds

		##all caeno

a <- ggplot(dat_all, aes(x=number.of.scaffolds,y=lost.orthogroups)) + geom_point() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", size=15), axis.text.y = element_text(colour="black", size=15),axis.title=element_text(size=20),legend.position="none") + xlab("Number of scaffolds") + ylab("Number of lost orthogroups") 

ggsave("scaffolds_v_lost_og_all_caeno.pdf", width=6, height=6, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("scaffolds_v_lost_og_all_caeno.png", width=6, height=6, units = "in",type="cairo-png")
print(a)
dev.off


#lm
summary(lm(lost.orthogroups ~ number.of.scaffolds, dat_all))



	##number of scaffolds

		##elegans group

a <- ggplot(dat_elegans, aes(x=number.of.scaffolds,y=lost.orthogroups)) + geom_point() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", size=15), axis.text.y = element_text(colour="black", size=15),axis.title=element_text(size=20),legend.position="none") + xlab("Number of scaffolds") + ylab("Number of lost orthogroups") 

ggsave("scaffolds_v_lost_og_elegans_group.pdf", width=6, height=6, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("scaffolds_v_lost_og_elegans_group.png", width=6, height=6, units = "in",type="cairo-png")
print(a)
dev.off


#lm
summary(lm(lost.orthogroups ~ number.of.scaffolds, dat_elegans))



	##n50

		##all caeno

a <- ggplot(dat_all, aes(x=log(n50.kB),y=lost.orthogroups)) + geom_point() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", size=15), axis.text.y = element_text(colour="black", size=15),axis.title=element_text(size=20),legend.position="none") + xlab("ln(N50)") + ylab("Number of lost orthogroups") 

ggsave("n50_v_lost_og_all_caeno.pdf", width=6, height=6, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("n50_v_lost_og_all_caeno.png", width=6, height=6, units = "in",type="cairo-png")
print(a)
dev.off


#lm
summary(lm(lost.orthogroups ~ log(n50.kB), dat_all))

	##n50

		##elegans group

a <- ggplot(dat_elegans, aes(x=log(n50.kB),y=lost.orthogroups)) + geom_point() + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", size=15), axis.text.y = element_text(colour="black", size=15),axis.title=element_text(size=20),legend.position="none") + xlab("ln(N50)") + ylab("Number of lost orthogroups") 

ggsave("n50_v_lost_og_elegans_group.pdf", width=6, height=6, units = "in", useDingbats=FALSE)
print(a)
dev.off

ggsave("n50_v_lost_og_elegans_group.png", width=6, height=6, units = "in",type="cairo-png")
print(a)
dev.off


#lm
summary(lm(lost.orthogroups ~ log(n50.kB), dat_elegans))


###Supplemental figures 14-15

#These data are in orthofinder_and_blast_results.zip
dat <- read.table("/home/gavin/genome/genome/dsd_figures_6-7-18/Orthogroups.GeneCount.csv", sep="\t", header=T)

#subset to just include caenorhabditis

caeno_dat <- dat[,c(3:30)]


#need to remove diploscapter og's

caeno_dat_a <-caeno_dat[!(caeno_dat$afra==0 & caeno_dat$angaria==0 & caeno_dat$brenneri==0 & caeno_dat$briggsae==0 & caeno_dat$castelli==0 & caeno_dat$doughertyi==0 & caeno_dat$elegans==0 & caeno_dat$japonica==0 & caeno_dat$kamaaina==0 & caeno_dat$latens==0 & caeno_dat$monodelphis==0 & caeno_dat$nigoni==0 & caeno_dat$plicata==0 & caeno_dat$remanei==0 & caeno_dat$sinica==0 & caeno_dat$sp21==0 & caeno_dat$sp26==0 & caeno_dat$sp28==0 & caeno_dat$sp29==0 & caeno_dat$sp31==0 & caeno_dat$sp32==0 & caeno_dat$sp34==0 & caeno_dat$sp38==0 & caeno_dat$sp39==0 & caeno_dat$sp40==0 & caeno_dat$tropicalis==0 & caeno_dat$virilis==0 & caeno_dat$wallacei==0),]



#now, also need to remove species-specific orthogroups

caeno_dat_b<-caeno_dat_a[!(caeno_dat_a$afra!=0 & caeno_dat_a$angaria==0 & caeno_dat_a$brenneri==0 & caeno_dat_a$briggsae==0 & caeno_dat_a$castelli==0 & caeno_dat_a$doughertyi==0 & caeno_dat_a$elegans==0 & caeno_dat_a$japonica==0 & caeno_dat_a$kamaaina==0 & caeno_dat_a$latens==0 & caeno_dat_a$monodelphis==0 & caeno_dat_a$nigoni==0 & caeno_dat_a$plicata==0 & caeno_dat_a$remanei==0 & caeno_dat_a$sinica==0 & caeno_dat_a$sp21==0 & caeno_dat_a$sp26==0 & caeno_dat_a$sp28==0 & caeno_dat_a$sp29==0 & caeno_dat_a$sp31==0 & caeno_dat_a$sp32==0 & caeno_dat_a$sp34==0 & caeno_dat_a$sp38==0 & caeno_dat_a$sp39==0 & caeno_dat_a$sp40==0 & caeno_dat_a$tropicalis==0 & caeno_dat_a$virilis==0 & caeno_dat_a$wallacei==0),]



caeno_dat_c<-caeno_dat_b[!(caeno_dat_b$afra==0 & caeno_dat_b$angaria!=0 & caeno_dat_b$brenneri==0 & caeno_dat_b$briggsae==0 & caeno_dat_b$castelli==0 & caeno_dat_b$doughertyi==0 & caeno_dat_b$elegans==0 & caeno_dat_b$japonica==0 & caeno_dat_b$kamaaina==0 & caeno_dat_b$latens==0 & caeno_dat_b$monodelphis==0 & caeno_dat_b$nigoni==0 & caeno_dat_b$plicata==0 & caeno_dat_b$remanei==0 & caeno_dat_b$sinica==0 & caeno_dat_b$sp21==0 & caeno_dat_b$sp26==0 & caeno_dat_b$sp28==0 & caeno_dat_b$sp29==0 & caeno_dat_b$sp31==0 & caeno_dat_b$sp32==0 & caeno_dat_b$sp34==0 & caeno_dat_b$sp38==0 & caeno_dat_b$sp39==0 & caeno_dat_b$sp40==0 & caeno_dat_b$tropicalis==0 & caeno_dat_b$virilis==0 & caeno_dat_b$wallacei==0),]

caeno_dat_d<-caeno_dat_c[!(caeno_dat_c$afra==0 & caeno_dat_c$angaria==0 & caeno_dat_c$brenneri!=0 & caeno_dat_c$briggsae==0 & caeno_dat_c$castelli==0 & caeno_dat_c$doughertyi==0 & caeno_dat_c$elegans==0 & caeno_dat_c$japonica==0 & caeno_dat_c$kamaaina==0 & caeno_dat_c$latens==0 & caeno_dat_c$monodelphis==0 & caeno_dat_c$nigoni==0 & caeno_dat_c$plicata==0 & caeno_dat_c$remanei==0 & caeno_dat_c$sinica==0 & caeno_dat_c$sp21==0 & caeno_dat_c$sp26==0 & caeno_dat_c$sp28==0 & caeno_dat_c$sp29==0 & caeno_dat_c$sp31==0 & caeno_dat_c$sp32==0 & caeno_dat_c$sp34==0 & caeno_dat_c$sp38==0 & caeno_dat_c$sp39==0 & caeno_dat_c$sp40==0 & caeno_dat_c$tropicalis==0 & caeno_dat_c$virilis==0 & caeno_dat_c$wallacei==0),]

caeno_dat_e<-caeno_dat_d[!(caeno_dat_d$afra==0 & caeno_dat_d$angaria==0 & caeno_dat_d$brenneri==0 & caeno_dat_d$briggsae!=0 & caeno_dat_d$castelli==0 & caeno_dat_d$doughertyi==0 & caeno_dat_d$elegans==0 & caeno_dat_d$japonica==0 & caeno_dat_d$kamaaina==0 & caeno_dat_d$latens==0 & caeno_dat_d$monodelphis==0 & caeno_dat_d$nigoni==0 & caeno_dat_d$plicata==0 & caeno_dat_d$remanei==0 & caeno_dat_d$sinica==0 & caeno_dat_d$sp21==0 & caeno_dat_d$sp26==0 & caeno_dat_d$sp28==0 & caeno_dat_d$sp29==0 & caeno_dat_d$sp31==0 & caeno_dat_d$sp32==0 & caeno_dat_d$sp34==0 & caeno_dat_d$sp38==0 & caeno_dat_d$sp39==0 & caeno_dat_d$sp40==0 & caeno_dat_d$tropicalis==0 & caeno_dat_d$virilis==0 & caeno_dat_d$wallacei==0),]

caeno_dat_f<-caeno_dat_e[!(caeno_dat_e$afra==0 & caeno_dat_e$angaria==0 & caeno_dat_e$brenneri==0 & caeno_dat_e$briggsae==0 & caeno_dat_e$castelli!=0 & caeno_dat_e$doughertyi==0 & caeno_dat_e$elegans==0 & caeno_dat_e$japonica==0 & caeno_dat_e$kamaaina==0 & caeno_dat_e$latens==0 & caeno_dat_e$monodelphis==0 & caeno_dat_e$nigoni==0 & caeno_dat_e$plicata==0 & caeno_dat_e$remanei==0 & caeno_dat_e$sinica==0 & caeno_dat_e$sp21==0 & caeno_dat_e$sp26==0 & caeno_dat_e$sp28==0 & caeno_dat_e$sp29==0 & caeno_dat_e$sp31==0 & caeno_dat_e$sp32==0 & caeno_dat_e$sp34==0 & caeno_dat_e$sp38==0 & caeno_dat_e$sp39==0 & caeno_dat_e$sp40==0 & caeno_dat_e$tropicalis==0 & caeno_dat_e$virilis==0 & caeno_dat_e$wallacei==0),]

caeno_dat_g<-caeno_dat_f[!(caeno_dat_f$afra==0 & caeno_dat_f$angaria==0 & caeno_dat_f$brenneri==0 & caeno_dat_f$briggsae==0 & caeno_dat_f$castelli==0 & caeno_dat_f$doughertyi!=0 & caeno_dat_f$elegans==0 & caeno_dat_f$japonica==0 & caeno_dat_f$kamaaina==0 & caeno_dat_f$latens==0 & caeno_dat_f$monodelphis==0 & caeno_dat_f$nigoni==0 & caeno_dat_f$plicata==0 & caeno_dat_f$remanei==0 & caeno_dat_f$sinica==0 & caeno_dat_f$sp21==0 & caeno_dat_f$sp26==0 & caeno_dat_f$sp28==0 & caeno_dat_f$sp29==0 & caeno_dat_f$sp31==0 & caeno_dat_f$sp32==0 & caeno_dat_f$sp34==0 & caeno_dat_f$sp38==0 & caeno_dat_f$sp39==0 & caeno_dat_f$sp40==0 & caeno_dat_f$tropicalis==0 & caeno_dat_f$virilis==0 & caeno_dat_f$wallacei==0),]

caeno_dat_h<-caeno_dat_g[!(caeno_dat_g$afra==0 & caeno_dat_g$angaria==0 & caeno_dat_g$brenneri==0 & caeno_dat_g$briggsae==0 & caeno_dat_g$castelli==0 & caeno_dat_g$doughertyi==0 & caeno_dat_g$elegans!=0 & caeno_dat_g$japonica==0 & caeno_dat_g$kamaaina==0 & caeno_dat_g$latens==0 & caeno_dat_g$monodelphis==0 & caeno_dat_g$nigoni==0 & caeno_dat_g$plicata==0 & caeno_dat_g$remanei==0 & caeno_dat_g$sinica==0 & caeno_dat_g$sp21==0 & caeno_dat_g$sp26==0 & caeno_dat_g$sp28==0 & caeno_dat_g$sp29==0 & caeno_dat_g$sp31==0 & caeno_dat_g$sp32==0 & caeno_dat_g$sp34==0 & caeno_dat_g$sp38==0 & caeno_dat_g$sp39==0 & caeno_dat_g$sp40==0 & caeno_dat_g$tropicalis==0 & caeno_dat_g$virilis==0 & caeno_dat_g$wallacei==0),]

caeno_dat_i<-caeno_dat_h[!(caeno_dat_h$afra==0 & caeno_dat_h$angaria==0 & caeno_dat_h$brenneri==0 & caeno_dat_h$briggsae==0 & caeno_dat_h$castelli==0 & caeno_dat_h$doughertyi==0 & caeno_dat_h$elegans==0 & caeno_dat_h$japonica!=0 & caeno_dat_h$kamaaina==0 & caeno_dat_h$latens==0 & caeno_dat_h$monodelphis==0 & caeno_dat_h$nigoni==0 & caeno_dat_h$plicata==0 & caeno_dat_h$remanei==0 & caeno_dat_h$sinica==0 & caeno_dat_h$sp21==0 & caeno_dat_h$sp26==0 & caeno_dat_h$sp28==0 & caeno_dat_h$sp29==0 & caeno_dat_h$sp31==0 & caeno_dat_h$sp32==0 & caeno_dat_h$sp34==0 & caeno_dat_h$sp38==0 & caeno_dat_h$sp39==0 & caeno_dat_h$sp40==0 & caeno_dat_h$tropicalis==0 & caeno_dat_h$virilis==0 & caeno_dat_h$wallacei==0),]

caeno_dat_j<-caeno_dat_i[!(caeno_dat_i$afra==0 & caeno_dat_i$angaria==0 & caeno_dat_i$brenneri==0 & caeno_dat_i$briggsae==0 & caeno_dat_i$castelli==0 & caeno_dat_i$doughertyi==0 & caeno_dat_i$elegans==0 & caeno_dat_i$japonica==0 & caeno_dat_i$kamaaina!=0 & caeno_dat_i$latens==0 & caeno_dat_i$monodelphis==0 & caeno_dat_i$nigoni==0 & caeno_dat_i$plicata==0 & caeno_dat_i$remanei==0 & caeno_dat_i$sinica==0 & caeno_dat_i$sp21==0 & caeno_dat_i$sp26==0 & caeno_dat_i$sp28==0 & caeno_dat_i$sp29==0 & caeno_dat_i$sp31==0 & caeno_dat_i$sp32==0 & caeno_dat_i$sp34==0 & caeno_dat_i$sp38==0 & caeno_dat_i$sp39==0 & caeno_dat_i$sp40==0 & caeno_dat_i$tropicalis==0 & caeno_dat_i$virilis==0 & caeno_dat_i$wallacei==0),]

caeno_dat_k<-caeno_dat_j[!(caeno_dat_j$afra==0 & caeno_dat_j$angaria==0 & caeno_dat_j$brenneri==0 & caeno_dat_j$briggsae==0 & caeno_dat_j$castelli==0 & caeno_dat_j$doughertyi==0 & caeno_dat_j$elegans==0 & caeno_dat_j$japonica==0 & caeno_dat_j$kamaaina==0 & caeno_dat_j$latens!=0 & caeno_dat_j$monodelphis==0 & caeno_dat_j$nigoni==0 & caeno_dat_j$plicata==0 & caeno_dat_j$remanei==0 & caeno_dat_j$sinica==0 & caeno_dat_j$sp21==0 & caeno_dat_j$sp26==0 & caeno_dat_j$sp28==0 & caeno_dat_j$sp29==0 & caeno_dat_j$sp31==0 & caeno_dat_j$sp32==0 & caeno_dat_j$sp34==0 & caeno_dat_j$sp38==0 & caeno_dat_j$sp39==0 & caeno_dat_j$sp40==0 & caeno_dat_j$tropicalis==0 & caeno_dat_j$virilis==0 & caeno_dat_j$wallacei==0),]

caeno_dat_l<-caeno_dat_k[!(caeno_dat_k$afra==0 & caeno_dat_k$angaria==0 & caeno_dat_k$brenneri==0 & caeno_dat_k$briggsae==0 & caeno_dat_k$castelli==0 & caeno_dat_k$doughertyi==0 & caeno_dat_k$elegans==0 & caeno_dat_k$japonica==0 & caeno_dat_k$kamaaina==0 & caeno_dat_k$latens==0 & caeno_dat_k$monodelphis!=0 & caeno_dat_k$nigoni==0 & caeno_dat_k$plicata==0 & caeno_dat_k$remanei==0 & caeno_dat_k$sinica==0 & caeno_dat_k$sp21==0 & caeno_dat_k$sp26==0 & caeno_dat_k$sp28==0 & caeno_dat_k$sp29==0 & caeno_dat_k$sp31==0 & caeno_dat_k$sp32==0 & caeno_dat_k$sp34==0 & caeno_dat_k$sp38==0 & caeno_dat_k$sp39==0 & caeno_dat_k$sp40==0 & caeno_dat_k$tropicalis==0 & caeno_dat_k$virilis==0 & caeno_dat_k$wallacei==0),]

caeno_dat_m<-caeno_dat_l[!(caeno_dat_l$afra==0 & caeno_dat_l$angaria==0 & caeno_dat_l$brenneri==0 & caeno_dat_l$briggsae==0 & caeno_dat_l$castelli==0 & caeno_dat_l$doughertyi==0 & caeno_dat_l$elegans==0 & caeno_dat_l$japonica==0 & caeno_dat_l$kamaaina==0 & caeno_dat_l$latens==0 & caeno_dat_l$monodelphis==0 & caeno_dat_l$nigoni!=0 & caeno_dat_l$plicata==0 & caeno_dat_l$remanei==0 & caeno_dat_l$sinica==0 & caeno_dat_l$sp21==0 & caeno_dat_l$sp26==0 & caeno_dat_l$sp28==0 & caeno_dat_l$sp29==0 & caeno_dat_l$sp31==0 & caeno_dat_l$sp32==0 & caeno_dat_l$sp34==0 & caeno_dat_l$sp38==0 & caeno_dat_l$sp39==0 & caeno_dat_l$sp40==0 & caeno_dat_l$tropicalis==0 & caeno_dat_l$virilis==0 & caeno_dat_l$wallacei==0),]

caeno_dat_n<-caeno_dat_m[!(caeno_dat_m$afra==0 & caeno_dat_m$angaria==0 & caeno_dat_m$brenneri==0 & caeno_dat_m$briggsae==0 & caeno_dat_m$castelli==0 & caeno_dat_m$doughertyi==0 & caeno_dat_m$elegans==0 & caeno_dat_m$japonica==0 & caeno_dat_m$kamaaina==0 & caeno_dat_m$latens==0 & caeno_dat_m$monodelphis==0 & caeno_dat_m$nigoni==0 & caeno_dat_m$plicata!=0 & caeno_dat_m$remanei==0 & caeno_dat_m$sinica==0 & caeno_dat_m$sp21==0 & caeno_dat_m$sp26==0 & caeno_dat_m$sp28==0 & caeno_dat_m$sp29==0 & caeno_dat_m$sp31==0 & caeno_dat_m$sp32==0 & caeno_dat_m$sp34==0 & caeno_dat_m$sp38==0 & caeno_dat_m$sp39==0 & caeno_dat_m$sp40==0 & caeno_dat_m$tropicalis==0 & caeno_dat_m$virilis==0 & caeno_dat_m$wallacei==0),]

caeno_dat_o<-caeno_dat_n[!(caeno_dat_n$afra==0 & caeno_dat_n$angaria==0 & caeno_dat_n$brenneri==0 & caeno_dat_n$briggsae==0 & caeno_dat_n$castelli==0 & caeno_dat_n$doughertyi==0 & caeno_dat_n$elegans==0 & caeno_dat_n$japonica==0 & caeno_dat_n$kamaaina==0 & caeno_dat_n$latens==0 & caeno_dat_n$monodelphis==0 & caeno_dat_n$nigoni==0 & caeno_dat_n$plicata==0 & caeno_dat_n$remanei!=0 & caeno_dat_n$sinica==0 & caeno_dat_n$sp21==0 & caeno_dat_n$sp26==0 & caeno_dat_n$sp28==0 & caeno_dat_n$sp29==0 & caeno_dat_n$sp31==0 & caeno_dat_n$sp32==0 & caeno_dat_n$sp34==0 & caeno_dat_n$sp38==0 & caeno_dat_n$sp39==0 & caeno_dat_n$sp40==0 & caeno_dat_n$tropicalis==0 & caeno_dat_n$virilis==0 & caeno_dat_n$wallacei==0),]

caeno_dat_p<-caeno_dat_o[!(caeno_dat_o$afra==0 & caeno_dat_o$angaria==0 & caeno_dat_o$brenneri==0 & caeno_dat_o$briggsae==0 & caeno_dat_o$castelli==0 & caeno_dat_o$doughertyi==0 & caeno_dat_o$elegans==0 & caeno_dat_o$japonica==0 & caeno_dat_o$kamaaina==0 & caeno_dat_o$latens==0 & caeno_dat_o$monodelphis==0 & caeno_dat_o$nigoni==0 & caeno_dat_o$plicata==0 & caeno_dat_o$remanei==0 & caeno_dat_o$sinica!=0 & caeno_dat_o$sp21==0 & caeno_dat_o$sp26==0 & caeno_dat_o$sp28==0 & caeno_dat_o$sp29==0 & caeno_dat_o$sp31==0 & caeno_dat_o$sp32==0 & caeno_dat_o$sp34==0 & caeno_dat_o$sp38==0 & caeno_dat_o$sp39==0 & caeno_dat_o$sp40==0 & caeno_dat_o$tropicalis==0 & caeno_dat_o$virilis==0 & caeno_dat_o$wallacei==0),]

caeno_dat_q<-caeno_dat_p[!(caeno_dat_p$afra==0 & caeno_dat_p$angaria==0 & caeno_dat_p$brenneri==0 & caeno_dat_p$briggsae==0 & caeno_dat_p$castelli==0 & caeno_dat_p$doughertyi==0 & caeno_dat_p$elegans==0 & caeno_dat_p$japonica==0 & caeno_dat_p$kamaaina==0 & caeno_dat_p$latens==0 & caeno_dat_p$monodelphis==0 & caeno_dat_p$nigoni==0 & caeno_dat_p$plicata==0 & caeno_dat_p$remanei==0 & caeno_dat_p$sinica==0 & caeno_dat_p$sp21!=0 & caeno_dat_p$sp26==0 & caeno_dat_p$sp28==0 & caeno_dat_p$sp29==0 & caeno_dat_p$sp31==0 & caeno_dat_p$sp32==0 & caeno_dat_p$sp34==0 & caeno_dat_p$sp38==0 & caeno_dat_p$sp39==0 & caeno_dat_p$sp40==0 & caeno_dat_p$tropicalis==0 & caeno_dat_p$virilis==0 & caeno_dat_p$wallacei==0),]

caeno_dat_r<-caeno_dat_q[!(caeno_dat_q$afra==0 & caeno_dat_q$angaria==0 & caeno_dat_q$brenneri==0 & caeno_dat_q$briggsae==0 & caeno_dat_q$castelli==0 & caeno_dat_q$doughertyi==0 & caeno_dat_q$elegans==0 & caeno_dat_q$japonica==0 & caeno_dat_q$kamaaina==0 & caeno_dat_q$latens==0 & caeno_dat_q$monodelphis==0 & caeno_dat_q$nigoni==0 & caeno_dat_q$plicata==0 & caeno_dat_q$remanei==0 & caeno_dat_q$sinica==0 & caeno_dat_q$sp21==0 & caeno_dat_q$sp26!=0 & caeno_dat_q$sp28==0 & caeno_dat_q$sp29==0 & caeno_dat_q$sp31==0 & caeno_dat_q$sp32==0 & caeno_dat_q$sp34==0 & caeno_dat_q$sp38==0 & caeno_dat_q$sp39==0 & caeno_dat_q$sp40==0 & caeno_dat_q$tropicalis==0 & caeno_dat_q$virilis==0 & caeno_dat_q$wallacei==0),]

caeno_dat_s<-caeno_dat_r[!(caeno_dat_r$afra==0 & caeno_dat_r$angaria==0 & caeno_dat_r$brenneri==0 & caeno_dat_r$briggsae==0 & caeno_dat_r$castelli==0 & caeno_dat_r$doughertyi==0 & caeno_dat_r$elegans==0 & caeno_dat_r$japonica==0 & caeno_dat_r$kamaaina==0 & caeno_dat_r$latens==0 & caeno_dat_r$monodelphis==0 & caeno_dat_r$nigoni==0 & caeno_dat_r$plicata==0 & caeno_dat_r$remanei==0 & caeno_dat_r$sinica==0 & caeno_dat_r$sp21==0 & caeno_dat_r$sp26==0 & caeno_dat_r$sp28!=0 & caeno_dat_r$sp29==0 & caeno_dat_r$sp31==0 & caeno_dat_r$sp32==0 & caeno_dat_r$sp34==0 & caeno_dat_r$sp38==0 & caeno_dat_r$sp39==0 & caeno_dat_r$sp40==0 & caeno_dat_r$tropicalis==0 & caeno_dat_r$virilis==0 & caeno_dat_r$wallacei==0),]

caeno_dat_t<-caeno_dat_s[!(caeno_dat_s$afra==0 & caeno_dat_s$angaria==0 & caeno_dat_s$brenneri==0 & caeno_dat_s$briggsae==0 & caeno_dat_s$castelli==0 & caeno_dat_s$doughertyi==0 & caeno_dat_s$elegans==0 & caeno_dat_s$japonica==0 & caeno_dat_s$kamaaina==0 & caeno_dat_s$latens==0 & caeno_dat_s$monodelphis==0 & caeno_dat_s$nigoni==0 & caeno_dat_s$plicata==0 & caeno_dat_s$remanei==0 & caeno_dat_s$sinica==0 & caeno_dat_s$sp21==0 & caeno_dat_s$sp26==0 & caeno_dat_s$sp28==0 & caeno_dat_s$sp29!=0 & caeno_dat_s$sp31==0 & caeno_dat_s$sp32==0 & caeno_dat_s$sp34==0 & caeno_dat_s$sp38==0 & caeno_dat_s$sp39==0 & caeno_dat_s$sp40==0 & caeno_dat_s$tropicalis==0 & caeno_dat_s$virilis==0 & caeno_dat_s$wallacei==0),]

caeno_dat_u<-caeno_dat_t[!(caeno_dat_t$afra==0 & caeno_dat_t$angaria==0 & caeno_dat_t$brenneri==0 & caeno_dat_t$briggsae==0 & caeno_dat_t$castelli==0 & caeno_dat_t$doughertyi==0 & caeno_dat_t$elegans==0 & caeno_dat_t$japonica==0 & caeno_dat_t$kamaaina==0 & caeno_dat_t$latens==0 & caeno_dat_t$monodelphis==0 & caeno_dat_t$nigoni==0 & caeno_dat_t$plicata==0 & caeno_dat_t$remanei==0 & caeno_dat_t$sinica==0 & caeno_dat_t$sp21==0 & caeno_dat_t$sp26==0 & caeno_dat_t$sp28==0 & caeno_dat_t$sp29==0 & caeno_dat_t$sp31!=0 & caeno_dat_t$sp32==0 & caeno_dat_t$sp34==0 & caeno_dat_t$sp38==0 & caeno_dat_t$sp39==0 & caeno_dat_t$sp40==0 & caeno_dat_t$tropicalis==0 & caeno_dat_t$virilis==0 & caeno_dat_t$wallacei==0),]

caeno_dat_v<-caeno_dat_u[!(caeno_dat_u$afra==0 & caeno_dat_u$angaria==0 & caeno_dat_u$brenneri==0 & caeno_dat_u$briggsae==0 & caeno_dat_u$castelli==0 & caeno_dat_u$doughertyi==0 & caeno_dat_u$elegans==0 & caeno_dat_u$japonica==0 & caeno_dat_u$kamaaina==0 & caeno_dat_u$latens==0 & caeno_dat_u$monodelphis==0 & caeno_dat_u$nigoni==0 & caeno_dat_u$plicata==0 & caeno_dat_u$remanei==0 & caeno_dat_u$sinica==0 & caeno_dat_u$sp21==0 & caeno_dat_u$sp26==0 & caeno_dat_u$sp28==0 & caeno_dat_u$sp29==0 & caeno_dat_u$sp31==0 & caeno_dat_u$sp32!=0 & caeno_dat_u$sp34==0 & caeno_dat_u$sp38==0 & caeno_dat_u$sp39==0 & caeno_dat_u$sp40==0 & caeno_dat_u$tropicalis==0 & caeno_dat_u$virilis==0 & caeno_dat_u$wallacei==0),]

caeno_dat_w<-caeno_dat_v[!(caeno_dat_v$afra==0 & caeno_dat_v$angaria==0 & caeno_dat_v$brenneri==0 & caeno_dat_v$briggsae==0 & caeno_dat_v$castelli==0 & caeno_dat_v$doughertyi==0 & caeno_dat_v$elegans==0 & caeno_dat_v$japonica==0 & caeno_dat_v$kamaaina==0 & caeno_dat_v$latens==0 & caeno_dat_v$monodelphis==0 & caeno_dat_v$nigoni==0 & caeno_dat_v$plicata==0 & caeno_dat_v$remanei==0 & caeno_dat_v$sinica==0 & caeno_dat_v$sp21==0 & caeno_dat_v$sp26==0 & caeno_dat_v$sp28==0 & caeno_dat_v$sp29==0 & caeno_dat_v$sp31==0 & caeno_dat_v$sp32==0 & caeno_dat_v$sp34!=0 & caeno_dat_v$sp38==0 & caeno_dat_v$sp39==0 & caeno_dat_v$sp40==0 & caeno_dat_v$tropicalis==0 & caeno_dat_v$virilis==0 & caeno_dat_v$wallacei==0),]

caeno_dat_x<-caeno_dat_w[!(caeno_dat_w$afra==0 & caeno_dat_w$angaria==0 & caeno_dat_w$brenneri==0 & caeno_dat_w$briggsae==0 & caeno_dat_w$castelli==0 & caeno_dat_w$doughertyi==0 & caeno_dat_w$elegans==0 & caeno_dat_w$japonica==0 & caeno_dat_w$kamaaina==0 & caeno_dat_w$latens==0 & caeno_dat_w$monodelphis==0 & caeno_dat_w$nigoni==0 & caeno_dat_w$plicata==0 & caeno_dat_w$remanei==0 & caeno_dat_w$sinica==0 & caeno_dat_w$sp21==0 & caeno_dat_w$sp26==0 & caeno_dat_w$sp28==0 & caeno_dat_w$sp29==0 & caeno_dat_w$sp31==0 & caeno_dat_w$sp32==0 & caeno_dat_w$sp34==0 & caeno_dat_w$sp38!=0 & caeno_dat_w$sp39==0 & caeno_dat_w$sp40==0 & caeno_dat_w$tropicalis==0 & caeno_dat_w$virilis==0 & caeno_dat_w$wallacei==0),]

caeno_dat_y<-caeno_dat_x[!(caeno_dat_x$afra==0 & caeno_dat_x$angaria==0 & caeno_dat_x$brenneri==0 & caeno_dat_x$briggsae==0 & caeno_dat_x$castelli==0 & caeno_dat_x$doughertyi==0 & caeno_dat_x$elegans==0 & caeno_dat_x$japonica==0 & caeno_dat_x$kamaaina==0 & caeno_dat_x$latens==0 & caeno_dat_x$monodelphis==0 & caeno_dat_x$nigoni==0 & caeno_dat_x$plicata==0 & caeno_dat_x$remanei==0 & caeno_dat_x$sinica==0 & caeno_dat_x$sp21==0 & caeno_dat_x$sp26==0 & caeno_dat_x$sp28==0 & caeno_dat_x$sp29==0 & caeno_dat_x$sp31==0 & caeno_dat_x$sp32==0 & caeno_dat_x$sp34==0 & caeno_dat_x$sp38==0 & caeno_dat_x$sp39!=0 & caeno_dat_x$sp40==0 & caeno_dat_x$tropicalis==0 & caeno_dat_x$virilis==0 & caeno_dat_x$wallacei==0),]

caeno_dat_z<-caeno_dat_y[!(caeno_dat_y$afra==0 & caeno_dat_y$angaria==0 & caeno_dat_y$brenneri==0 & caeno_dat_y$briggsae==0 & caeno_dat_y$castelli==0 & caeno_dat_y$doughertyi==0 & caeno_dat_y$elegans==0 & caeno_dat_y$japonica==0 & caeno_dat_y$kamaaina==0 & caeno_dat_y$latens==0 & caeno_dat_y$monodelphis==0 & caeno_dat_y$nigoni==0 & caeno_dat_y$plicata==0 & caeno_dat_y$remanei==0 & caeno_dat_y$sinica==0 & caeno_dat_y$sp21==0 & caeno_dat_y$sp26==0 & caeno_dat_y$sp28==0 & caeno_dat_y$sp29==0 & caeno_dat_y$sp31==0 & caeno_dat_y$sp32==0 & caeno_dat_y$sp34==0 & caeno_dat_y$sp38==0 & caeno_dat_y$sp39==0 & caeno_dat_y$sp40!=0 & caeno_dat_y$tropicalis==0 & caeno_dat_y$virilis==0 & caeno_dat_y$wallacei==0),]

caeno_dat_aa<-caeno_dat_z[!(caeno_dat_z$afra==0 & caeno_dat_z$angaria==0 & caeno_dat_z$brenneri==0 & caeno_dat_z$briggsae==0 & caeno_dat_z$castelli==0 & caeno_dat_z$doughertyi==0 & caeno_dat_z$elegans==0 & caeno_dat_z$japonica==0 & caeno_dat_z$kamaaina==0 & caeno_dat_z$latens==0 & caeno_dat_z$monodelphis==0 & caeno_dat_z$nigoni==0 & caeno_dat_z$plicata==0 & caeno_dat_z$remanei==0 & caeno_dat_z$sinica==0 & caeno_dat_z$sp21==0 & caeno_dat_z$sp26==0 & caeno_dat_z$sp28==0 & caeno_dat_z$sp29==0 & caeno_dat_z$sp31==0 & caeno_dat_z$sp32==0 & caeno_dat_z$sp34==0 & caeno_dat_z$sp38==0 & caeno_dat_z$sp39==0 & caeno_dat_z$sp40==0 & caeno_dat_z$tropicalis!=0 & caeno_dat_z$virilis==0 & caeno_dat_z$wallacei==0),]

caeno_dat_bb<-caeno_dat_aa[!(caeno_dat_aa$afra==0 & caeno_dat_aa$angaria==0 & caeno_dat_aa$brenneri==0 & caeno_dat_aa$briggsae==0 & caeno_dat_aa$castelli==0 & caeno_dat_aa$doughertyi==0 & caeno_dat_aa$elegans==0 & caeno_dat_aa$japonica==0 & caeno_dat_aa$kamaaina==0 & caeno_dat_aa$latens==0 & caeno_dat_aa$monodelphis==0 & caeno_dat_aa$nigoni==0 & caeno_dat_aa$plicata==0 & caeno_dat_aa$remanei==0 & caeno_dat_aa$sinica==0 & caeno_dat_aa$sp21==0 & caeno_dat_aa$sp26==0 & caeno_dat_aa$sp28==0 & caeno_dat_aa$sp29==0 & caeno_dat_aa$sp31==0 & caeno_dat_aa$sp32==0 & caeno_dat_aa$sp34==0 & caeno_dat_aa$sp38==0 & caeno_dat_aa$sp39==0 & caeno_dat_aa$sp40==0 & caeno_dat_aa$tropicalis==0 & caeno_dat_aa$virilis!=0 & caeno_dat_aa$wallacei==0),]

caeno_dat_cc<-caeno_dat_bb[!(caeno_dat_bb$afra==0 & caeno_dat_bb$angaria==0 & caeno_dat_bb$brenneri==0 & caeno_dat_bb$briggsae==0 & caeno_dat_bb$castelli==0 & caeno_dat_bb$doughertyi==0 & caeno_dat_bb$elegans==0 & caeno_dat_bb$japonica==0 & caeno_dat_bb$kamaaina==0 & caeno_dat_bb$latens==0 & caeno_dat_bb$monodelphis==0 & caeno_dat_bb$nigoni==0 & caeno_dat_bb$plicata==0 & caeno_dat_bb$remanei==0 & caeno_dat_bb$sinica==0 & caeno_dat_bb$sp21==0 & caeno_dat_bb$sp26==0 & caeno_dat_bb$sp28==0 & caeno_dat_bb$sp29==0 & caeno_dat_bb$sp31==0 & caeno_dat_bb$sp32==0 & caeno_dat_bb$sp34==0 & caeno_dat_bb$sp38==0 & caeno_dat_bb$sp39==0 & caeno_dat_bb$sp40==0 & caeno_dat_bb$tropicalis==0 & caeno_dat_bb$virilis==0 & caeno_dat_bb$wallacei!=0),]


#get means...

caeno_dat_cc$mean <- rowMeans(caeno_dat_cc)

#summary stats
summary(caeno_dat_cc$mean)

#readable plot with limited range

a <- ggplot(caeno_dat_cc, aes(x=mean)) + geom_histogram(bins=100) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16,face="bold"),legend.title = element_text(colour="black", size=15, face="bold"), legend.text = element_text(colour="black", size = 14),legend.key=element_blank()) + xlab("Average orthologous group gene number") + ylab("Frequency") + xlim(0,5) + scale_y_continuous(breaks=c(0,1000,2000,3000,4000,5000))


ggsave("average_orthologous_group_gene_number_per_species_x_lim_5.png", width=9, height=6)
print(a)
dev.off

#readable plot with whole range

b <- ggplot(caeno_dat_cc, aes(x=mean)) + geom_histogram(bins=100) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text=element_text(size=14, colour="black"),axis.ticks = element_line(colour = "black"), axis.title=element_text(size=16,face="bold"),legend.title = element_text(colour="black", size=15, face="bold"), legend.text = element_text(colour="black", size = 14),legend.key=element_blank()) + xlab("Average orthologous group gene number") + ylab("Frequency") + xlim(1,90) +scale_y_continuous(limits=c(0,2000),breaks=c(0,500,1000,1500,2000))


ggsave("average_orthologous_group_gene_number_per_species.png", width=9, height=6)
print(b)
dev.off