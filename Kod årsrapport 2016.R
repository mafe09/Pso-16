

library(stringr)

#Läser in data med PsoReg data för att skapa individdataset
Pso_individ <- read.delim("Uttag Årsrapport1.txt",header=TRUE,sep=";",encoding="UTF-8")

names(Pso_individ) <- c("OrganisationName","ContactDate","PERSNR","RegisteredAt")

Pso_individ$OrganisationName <- as.character(Pso_individ$OrganisationName)

Pso_individ <- Pso_individ[!(Pso_individ$OrganisationName=="Test"),]


Pso_individ$ContactDate <- as.Date(Pso_individ$ContactDate)

Pso_individ <- subset(Pso_individ, is.na(ContactDate)==FALSE)


Pso_individ <- Pso_individ[order(Pso_individ$ContactDate,decreasing=FALSE),]
Pso_individ <- Pso_individ[order(Pso_individ$PERSNR,decreasing=FALSE),]
#skapar en variabel som indikerar de unika individerna
Pso_individ$dupli_PatientID <- duplicated(Pso_individ$PERSNR)

#plockar bort dubletter
Pso_individ<-subset(Pso_individ,dupli_PatientID==FALSE)




Pso_individ$Contact_year <- 1900 + as.POSIXlt(Pso_individ$ContactDate)$year
Pso_individ$Contact_moth <-1 + as.POSIXlt(Pso_individ$ContactDate)$mon
Pso_individ$Contact_year_moth <- paste(as.character(Pso_individ$Contact_year),as.character(Pso_individ$Contact_moth),sep ="")




Pso_individ$RegisteredAt <- as.character(Pso_individ$RegisteredAt)
Pso_individ$RegisteredAt[Pso_individ$RegisteredAt==""] <- "2013-12-24"

Pso_individ$RegisteredAt <- as.Date(Pso_individ$RegisteredAt)
Pso_individ$Registred_year <- 1900 + as.POSIXlt(Pso_individ$RegisteredAt)$year
Pso_individ$Registred_moth <-1 + as.POSIXlt(Pso_individ$RegisteredAt)$mon
Pso_individ$Registred_year_moth <- paste(as.character(Pso_individ$Registred_year),as.character(Pso_individ$Registred_moth),sep ="")

###############

