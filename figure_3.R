library(ggplot2)

#all_caeno

dat <- read.table("elegans_constituents_of_lost_og_phen_data_all_caeno.tsv", sep=" ", header=F)

#rename columns

colnames(dat)[1] <- "lost_elegans_genes"
colnames(dat)[2] <- "species"
colnames(dat)[3] <- "phenotype_class"

#exclude elegans as this is all in reference to elegans and it has lost zero of its own genes

dat_b <- dat[dat$species != "elegans",]



#for summary stats, add any_phenotype and no_phenotype for total c elegans constituents of lost orthogroups

library(reshape2)

	# cast (convert from long to wide)

dat_cast <- dcast(dat_b, species ~ phenotype_class, value.var="lost_elegans_genes")

	#get total elegans constituents of lost orthologous groups

dat_cast$tot_elegans_const <- dat_cast$any_phenotype + dat_cast$no_phenotype

	#fraction of total with phenotypes
dat_cast$fra_w_phenotype <- dat_cast$any_phenotype/dat_cast$tot_elegans_const

	#summary stats of that
summary(dat_cast$fra_w_phenotype)

	#fraction of total with essential
dat_cast$fra_w_essential_phenotype <- dat_cast$essential_phenotype/dat_cast$tot_elegans_const

summary(dat_cast$fra_w_essential_phenotype)


#exclude phenotype class "any phenotype" as we want to see a stacked bar graph and this category defines the sum of all the other ones

dat_c <- dat_b[dat_b$phenotype_class != "any_phenotype",]

#drop some levels

dat_c$species <- droplevels(dat_c$species)
dat_c$phenotype_class <- droplevels(dat_c$phenotype_class)

#re-order species somewhat phylogenetically

dat_c$species <- factor(dat_c$species, levels = c("latens","remanei","briggsae","nigoni","sp26","sp40","sinica","tropicalis","wallacei","doughertyi","brenneri","sp34","kamaaina","sp28","sp39","sp29","sp32","afra","japonica","sp31","castelli","angaria","sp38","virilis","plicata","sp21","monodelphis"))

#re-order phenotypic classes 

dat_c$phenotype_class <- factor(dat_c$phenotype_class, levels = c("no_phenotype","unessential_phenotype","essential_phenotype"))

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



species_labels <- c(latens,remanei,briggsae,nigoni,sp26,sp40,sinica,tropicalis,wallacei,doughertyi,brenneri,inopinata,kamaaina,sp28,sp39,sp29,sp32,afra,japonica,sp31,castelli,angaria,sp38,virilis,plicata,sp21,monodelphis)



#make plot

a <- ggplot(dat_c,aes(x=species, y=lost_elegans_genes,fill=phenotype_class)) + geom_bar(stat="identity") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", angle = 45, hjust =1, size=10), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=14,face="plain"), strip.background = element_rect(colour="white", fill="white"),legend.position="none") + xlab("Species") + ylab("C. elegans constituents of\nlost orthologous groups")+ scale_fill_brewer() + scale_x_discrete(labels = species_labels) + ylim(0,400)


ggsave("elegans_phenotypes_all_caeno.pdf", width=6, height=3.5, units = "in", useDingbats=FALSE)
print(a)
dev.off




#elegans_group

dat <- read.table("elegans_constituents_of_lost_og_phen_data_elegans_group.tsv", sep=" ", header=F)

#rename columns

colnames(dat)[1] <- "lost_elegans_genes"
colnames(dat)[2] <- "species"
colnames(dat)[3] <- "phenotype_class"

#exclude elegans as this is all in reference to elegans and it has lost zero of its own genes

dat_b <- dat[dat$species != "elegans",]


dat_cast <- dcast(dat_b, species ~ phenotype_class, value.var="lost_elegans_genes")

	#get total elegans constituents of lost orthologous groups

dat_cast$tot_elegans_const <- dat_cast$any_phenotype + dat_cast$no_phenotype

	#fraction of total with phenotypes
dat_cast$fra_w_phenotype <- dat_cast$any_phenotype/dat_cast$tot_elegans_const

	#summary stats of that
summary(dat_cast$fra_w_phenotype)

	#fraction of total with essential
dat_cast$fra_w_essential_phenotype <- dat_cast$essential_phenotype/dat_cast$tot_elegans_const

summary(dat_cast$fra_w_essential_phenotype)





#exclude phenotype class "any phenotype" as we want to see a stacked bar graph and this category defines the sum of all the other ones

dat_c <- dat_b[dat_b$phenotype_class != "any_phenotype",]

#drop some levels

dat_c$species <- droplevels(dat_c$species)
dat_c$phenotype_class <- droplevels(dat_c$phenotype_class)

#re-order species somewhat phylogenetically

dat_c$species <- factor(dat_c$species, levels = c("latens","remanei","briggsae","nigoni","sp26","sp40","sinica","tropicalis","wallacei","doughertyi","brenneri","sp34","kamaaina"))

#re-order phenotypic classes 

dat_c$phenotype_class <- factor(dat_c$phenotype_class, levels = c("no_phenotype","unessential_phenotype","essential_phenotype"))

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
kamaaina <- expression(paste(italic("C. kamaaina")))


species_labels <- c(latens,remanei,briggsae,nigoni,sp26,sp40,sinica,tropicalis,wallacei,doughertyi,brenneri,inopinata,kamaaina)



#make plot

a <- ggplot(dat_c,aes(x=species, y=lost_elegans_genes,fill=phenotype_class)) + geom_bar(stat="identity") + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", angle = 45, hjust =1, size=10), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=14,face="plain"), strip.background = element_rect(colour="white", fill="white"),legend.position="none") + xlab("Species") + ylab("C. elegans constituents of\nlost orthologous groups")+ scale_fill_brewer() + scale_x_discrete(labels = species_labels) + scale_y_continuous(breaks=c(0,100,200,300,400,500,600,700), limits=c(0, 700))

ggsave("elegans_phenotypes_elegans_group.pdf", width=6, height=3.5, units = "in", useDingbats=FALSE)
print(a)
dev.off
