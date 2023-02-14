ncbi_ids <- c("HQ433692.1","HQ433694.1","HQ433691.1") #create a vector object of NCBI IDs
library(rentrez)  # load the rentrez package
Bburg<-entrez_fetch(db = "nuccore", id = ncbi_ids, rettype = "fasta") #download data from NCBI databases
# db is the name of database to use
# id is a vector of the unique IDs
# rettype is the format to get the data in 
Bburg
Sequences<-strsplit(Bburg, split="\n\n")
Sequences<-unlist(Sequences)
header<-gsub("(^>.*sequence)\\n[ATCG].*","\\1",Sequences)
seq<-gsub("^>.*sequence\\n([ATCG].*)","\\1",Sequences)
Sequences<-data.frame(Name=header,Sequence=seq)
Sequences<-gsub("\n","", Sequences)
write.csv(Sequences,"Sequences.csv",row.names=TRUE)
