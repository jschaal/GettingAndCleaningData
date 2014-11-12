# Question 2

url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fdata%2Fss06pid.csv"
download.file(url,"./data/acs.csv")
acs <- read.csv("./data/acs.csv")
l <- sqldf("select pwgtp1 from acs where AGEP < 50")

# Question 3
sqldf("select distinct AGEP from acs")

# Question 4
url <- "http://biostat.jhsph.edu/~jleek/contact.html"
con <- url(url)
htmlCode <- readLines(con)
lines <- c(10,20,30,100)
nchar(htmlCode[lines])

# Question 5
library(data.table)
url <- "https://d396qusza40orc.cloudfront.net/getdata%2Fwksst8110.for"
download.file(url,"./data/sst.for")
widths <- c(1,9,5,4,4,5,4,4,5,4,4,5,4,4)
ds <- read.fwf("./data/sst.for",widths = widths,skip = 4)
names <- c("b1","C1","b2","C2","C3","b3","C4","C5","b4","C6","C7","b5","C8","C9")
colnames(ds) <- names
sum(ds$C4)

