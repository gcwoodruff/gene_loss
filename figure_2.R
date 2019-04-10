library(ggplot2)

#all_caeno

dat <- read.table("all_caeno_og.tsv", sep=" ", header=F)

#rename columns

colnames(dat)[1] <- "lost_og"
colnames(dat)[2] <- "species"


#get selfing data in there (is species a selfer?)

dat$reproductive_mode[dat$species == "brenneri"] <- "female/male"
dat$reproductive_mode <- as.factor(dat$reproductive_mode)
levels(dat$reproductive_mode) <- c("female/male", "hermaphroditic")
dat$reproductive_mode[dat$species == "brenneri"] <- "female/male"
dat$reproductive_mode[dat$species == "briggsae"] <- "hermaphroditic"
dat$reproductive_mode[dat$species == "elegans"] <- "hermaphroditic"
dat$reproductive_mode[dat$species == "latens"] <- "female/male"
dat$reproductive_mode[dat$species == "nigoni"] <- "female/male"
dat$reproductive_mode[dat$species == "remanei"] <- "female/male"
dat$reproductive_mode[dat$species == "sinica"] <- "female/male"
dat$reproductive_mode[dat$species == "sp21"] <- "female/male"
dat$reproductive_mode[dat$species == "tropicalis"] <- "hermaphroditic"
dat$reproductive_mode[dat$species == "doughertyi"] <- "female/male"
dat$reproductive_mode[dat$species == "kamaaina"] <- "female/male"
dat$reproductive_mode[dat$species == "sp26"] <- "female/male"
dat$reproductive_mode[dat$species == "sp28"] <- "female/male"
dat$reproductive_mode[dat$species == "sp29"] <- "female/male"
dat$reproductive_mode[dat$species == "sp31"] <- "female/male"
dat$reproductive_mode[dat$species == "sp32"] <- "female/male"
dat$reproductive_mode[dat$species == "sp38"] <- "female/male"
dat$reproductive_mode[dat$species == "sp39"] <- "female/male"
dat$reproductive_mode[dat$species == "sp40"] <- "female/male"
dat$reproductive_mode[dat$species == "virilis"] <- "female/male"
dat$reproductive_mode[dat$species == "wallacei"] <- "female/male"
dat$reproductive_mode[dat$species == "afra"] <- "female/male"
dat$reproductive_mode[dat$species == "castelli"] <- "female/male"
dat$reproductive_mode[dat$species == "angaria"] <- "female/male"
dat$reproductive_mode[dat$species == "japonica"] <- "female/male"
dat$reproductive_mode[dat$species == "monodelphis"] <- "female/male"
dat$reproductive_mode[dat$species == "plicata"] <- "female/male"
dat$reproductive_mode[dat$species == "sp34"] <- "female/male"
dat$reproductive_mode[dat$species == "angaria"] <- "female/male"

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



#make plot

a <- ggplot(dat,aes(x=species, y=lost_og)) + geom_bar(stat="identity",aes(fill=reproductive_mode)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", angle = 45, hjust =1, size=10), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=12,face="plain"), strip.background = element_rect(colour="white", fill="white"),legend.position="none") + xlab("Species") + ylab("Number of lost\northologous groups")+ scale_fill_brewer(name = "reproductive mode") + scale_x_discrete(labels = species_labels) + ylim(0,400)


ggsave("lost_orthogroups_all_caeno.pdf", width=6, height=3.5, units = "in", useDingbats=FALSE)
print(a)
dev.off

##elegans group

dat <- read.table("elegans_group_og.tsv", sep=" ", header=F)

#rename columns

colnames(dat)[1] <- "lost_og"
colnames(dat)[2] <- "species"


#get selfing data in there (is species a selfer?)

dat$reproductive_mode[dat$species == "brenneri"] <- "female/male"
dat$reproductive_mode <- as.factor(dat$reproductive_mode)
levels(dat$reproductive_mode) <- c("female/male", "hermaphroditic")
dat$reproductive_mode[dat$species == "brenneri"] <- "female/male"
dat$reproductive_mode[dat$species == "briggsae"] <- "hermaphroditic"
dat$reproductive_mode[dat$species == "elegans"] <- "hermaphroditic"
dat$reproductive_mode[dat$species == "latens"] <- "female/male"
dat$reproductive_mode[dat$species == "nigoni"] <- "female/male"
dat$reproductive_mode[dat$species == "remanei"] <- "female/male"
dat$reproductive_mode[dat$species == "sinica"] <- "female/male"
dat$reproductive_mode[dat$species == "tropicalis"] <- "hermaphroditic"
dat$reproductive_mode[dat$species == "doughertyi"] <- "female/male"
dat$reproductive_mode[dat$species == "kamaaina"] <- "female/male"
dat$reproductive_mode[dat$species == "sp26"] <- "female/male"
dat$reproductive_mode[dat$species == "sp40"] <- "female/male"
dat$reproductive_mode[dat$species == "wallacei"] <- "female/male"
dat$reproductive_mode[dat$species == "sp34"] <- "female/male"


#re-order species somewhat phylogenetically

dat$species <- factor(dat$species, levels = c("latens","remanei","briggsae","nigoni","sp26","sp40","sinica","tropicalis","wallacei","doughertyi","brenneri","sp34","elegans","kamaaina"))


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

species_labels <- c(latens,remanei,briggsae,nigoni,sp26,sp40,sinica,tropicalis,wallacei,doughertyi,brenneri,inopinata,elegans,kamaaina)



#make plot

a <- ggplot(dat,aes(x=species, y=lost_og)) + geom_bar(stat="identity",aes(fill=reproductive_mode)) + theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(), panel.background = element_blank(), axis.line = element_line(colour = "black"), axis.text.x = element_text(colour="black", angle = 45, hjust =1, size=10), axis.text.y = element_text(colour="black", size=11),axis.title=element_text(size=12,face="plain"), strip.background = element_rect(colour="white", fill="white"),legend.position="none") + xlab("Species") + ylab("Number of lost\northologous groups")+ scale_fill_brewer(name = "reproductive mode") + scale_x_discrete(labels = species_labels) + scale_y_continuous(breaks = c(0,100,200,300,400,500,600,700), limits =c(0,700))


ggsave("lost_orthogroups_elegans_group.pdf", width=6, height=3.5, units = "in", useDingbats=FALSE)
print(a)
dev.off

