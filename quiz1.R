#question 1
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06hid.csv"
download.file(fileUrl,destfile = "./data/ss06hid.csv")
#data.table version
inDataDT <- fread(input = "./data/ss06hid.csv")
length(inDataDT[inDataDT$VAL==24,VAL])

#data.frame version
inDataDF <- read.table(file = "./data/ss06hid.csv",sep=",",header = TRUE,na.strings = " ")
sum(inDataDF$VAL == 24,na.rm = TRUE)

#53

#question 3
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
            "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2FDATA.gov_NGAP.xlsx"
download.file(fileUrl,destfile = "./data/NGAP2.xlsx")
dat <- read.xlsx("./data/NGAP.xlsx",sheetIndex = 1, colIndex = 7:15, rowIndex = 18:23)
sum(dat$Zip*dat$Ext,na.rm=T) 

#question #4
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)

library(XML)

fileUrl <- "http://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Frestaurants.xml"
#fileUrl <- "http://www.w3schools.com/xml/simple.xml"
#fileUrl <- "./data/getdata_data_restaurants.xml"
doc <- xmlTreeParse(fileUrl,useInternal=TRUE)
rootNode <- xmlRoot(doc)
zipcodes <-xpathSApply(rootNode,"//zipcode",xmlValue)
sum(zipcodes == "21231")

#question #5
fileUrl <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(fileUrl,destfile = "./data/Fss06pid.csv")
DT <- fread(input = "./data/Fss06pid.csv")

system.time({mean(DT[DT$SEX==1,]$pwgtp15); mean(DT[DT$SEX==2,]$pwgtp15)} )
#user  system elapsed 
#0.06    0.00    0.06 

system.time({DT[,mean(pwgtp15),by=SEX]  })
#0       0       0 

system.time({sapply(split(DT$pwgtp15,DT$SEX),mean) })
#0       0       0 

system.time({tapply(DT$pwgtp15,DT$SEX,mean) })


system.time({rowMeans(DT)[DT$SEX==1]; rowMeans(DT)[DT$SEX==2] })

system.time({mean(DT$pwgtp15,by=DT$SEX)})