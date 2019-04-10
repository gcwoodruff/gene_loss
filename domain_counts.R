
#use to get the number of domains per gene from file "elegans_domains.txt"

#to use from command line:
	#Rscript domain_counts.R elegans_domains.txt


#load packages

library(reshape2)
library(tidyverse)

#get data in there

args <- commandArgs(TRUE)

file <- args[1]

dat <- read.table(file, sep="\t", header=F)

#turn long data into wide

dat_1 <- dat %>% gather(Key, value, -V1) %>% unite("value", c(Key, value)) %>%
  group_by(V1, value) %>%
  summarise(count = n())  %>%
  spread(value, count, fill = 0) %>%
  as.data.frame()

#sum rows

# 9720 variables ; 2:9720

dat_1$num_domains <- rowSums(dat_1[,c(2:9720)])

# new df

dat_2 <- cbind(levels(dat_1$V1),dat_1$num_domains)

dat_3 <- as.data.frame(dat_2)

dat_3$V2 <- as.numeric(levels(dat_3$V2))[dat_3$V2]

#print

write.table(dat_3,"elegans_domain_counts",sep="\t",row.names=FALSE, col.names=FALSE,quote=FALSE)

