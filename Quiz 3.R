# Q1
inData <- read.csv("./data/getdata_data_ss06hid.csv")
agricultureLogical <- inData$ACR==3 & inData$AGS==6
which(agricultureLogical)[1:3]

#ss1 <- which(inData$ACR==3 & inData$AGS==6)
#inData[ss1,c("SERIALNO","ACR","AGS")]

# Q2
library(jpeg)
image <- readJPEG("./data/getdata_jeff.jpg",native = TRUE)
quantile(x = image,c(.3,.8))

# Q3
gdpNames <- c("CountryCode","Rank","V3","Country","Dollars","V6","V7","V8","V9","V10")
gdpData <- read.csv("./data/getdata_data_GDP.csv",skip=5,header = FALSE,sep=",",stringsAsFactors=FALSE)
names(gdpData) <- gdpNames
gdpData$Rank <- as.numeric(gdpData$Rank)
gdpDataSubSet<- gdpData[which(gdpData$Rank>0),]
gdpDataSubSet$index <- 1:nrow(gdpDataSubSet)
eduData <- read.csv("./data/getdata_data_EDSTATS_Country.csv")
length(intersect(eduData$CountryCode,gdpDataSubSet$CountryCode))
sortOrder <- sort(gdpDataSubSet$index,decreasing = TRUE)
gdpDataSubSet[sortOrder,][13,]

# Q4
hi1 <- eduData[which(eduData$Income.Group=="High income: OECD"),]
rs1 <- gdpDataSubSet$Rank[gdpDataSubSet$CountryCode %in% hi1$CountryCode]
mean(rs1)

hi2 <- eduData[which(eduData$Income.Group=="High income: nonOECD"),]
rs2 <- gdpDataSubSet$Rank[gdpDataSubSet$CountryCode %in% hi2$CountryCode]
mean(rs2)

merged <- merge(gdpDataSubSet,eduData,all=TRUE)
mean(merged$Rank[merged$Income.Group=="High income: OECD"],na.rm = TRUE)
mean(merged$Rank[merged$Income.Group=="High income: nonOECD"],na.rm = TRUE)

# Q5
merged <- merge(gdpDataSubSet,eduData)
merged$group <- cut2(merged$Rank,g=5)
table(merged$group,merged$Income.Group)
