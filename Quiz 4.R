#Q1
indata <- read.csv("./data/getdata_data_ss06hid.csv")
innames <- names(indata)
splitnames <- strsplit(innames,"wgtp")
splitnames[123]

#Q2
gdpNames <- c("CountryCode","Rank","V3","Country","Dollars","V6","V7","V8","V9","V10")
gdpData <- read.csv("./data/getdata_data_GDP.csv",skip=5, header = FALSE,sep=",",stringsAsFactors=FALSE)
names(gdpData) <- gdpNames
gdpData$Rank <- as.numeric(gdpData$Rank)
gdpDataSubSet<- gdpData[which(gdpData$Rank>0),]
gdpvals <- gsub(",","",gdpDataSubSet$Dollars)
gdpval <- as.numeric(gdpvals)
mean(gdpval)

#Q3
grep("^United",gdpDataSubSet$Country,value = TRUE)

#Q4
gdpNames <- c("CountryCode","Rank","V3","Country","Dollars","V6","V7","V8","V9","V10")
gdpData <- read.csv("./data/getdata_data_GDP.csv",skip=5,
                    header = FALSE,sep=",",stringsAsFactors=FALSE)
names(gdpData) <- gdpNames
gdpData$Rank <- as.numeric(gdpData$Rank)
gdpDataSubSet<- gdpData[which(gdpData$Rank>0),]
gdpDataSubSet$index <- 1:nrow(gdpDataSubSet)
eduData <- read.csv("./data/getdata_data_EDSTATS_Country.csv")
merged <- merge(gdpDataSubSet,eduData,all=FALSE)

grep("[Ff]iscal year end: +[Jj]une",merged$Special.Notes,value = TRUE)

#Q5
library(lubridate)
library(quantmod)
amzn <- getSymbols("AMZN",auto.assign=FALSE)
sampleTimes <- index(amzn) 
dfa <- data.frame(amzn)
dfa$tradedatec <- row.names(dfa)
dfa$tradedate <- ymd(dfa$tradedatec)
sum(year(dfa$tradedate)==2012)
sum(year(dfa$tradedate)==2012 & wday(dfa$tradedate)==2)

