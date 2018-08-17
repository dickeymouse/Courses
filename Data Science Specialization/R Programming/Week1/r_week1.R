##R Programming for Data Science

#5.R Nuts and Bolts

x <- 1
x
print(x)
x <- 11:30
x
print(1:100)


#integer
var1 <- 1
class(var1)

var2 <- 1L
class(var2)

var3 <- Inf
class(var3)

1/var3 #=0

attributes(var3)


#Vector
x <- c(0.5, 0.6)
x <- c(TRUE, FALSE)
x <- 1:29

x <- vector("numeric", length = 10)
x

x <- vector("character", length = 5)
x

x <- vector("logical", length = 5)
x

y <- c(1.7, "a")
y
y <- c(T,2)
y
y <- c("a", T)
y

x <- 0:6
class(x)
as.logical(x)
as.numeric(x)
as.character(x)


#matrices
##vectors with dimenion attribute
m <- matrix(1:6, nrow = 2, ncol = 3)
m
dim(m)
attributes(m)

m <- 1:10
dim(m) <- c(2,5)
m
dim(m) <- c(5,2)
m

as.numeric(m) #1:10

x <- 1:3
y <- 10:12
cbind(x,y)   ##column bind
rbind(x,y)   ##row bind


#List
x <- list(1, "a", TRUE, 1 + 4i)
x
x[1]
x[[1]]

x<- vector("list", length = 4)
x


#Factor
x <- factor(c("yes","yes","no","yes"))
x
c("yes","yes","no","yes")

table(x)
unclass(x)   ##see the underlining integer

x1<- factor(c("yes","yes","no"), levels = c("yes","no")) #1 = yes 2 = no
x1

x2<- factor(c("yes","yes","no"), levels = c("no","yes"))  #1 = no 2 = yes
x2
unclass(x1)
unclass(x2)


#Missing Values
x <- c(1, 2, NA, 10)
is.na(x)
is.nan(x)

##Data Frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, T))
x
attributes(x)
nrow(x)
ncol(x)


#names
x <- 1:3
names(x) <- c("New York", "Seattle")
x
names(x)
attributes(x)

x <- list("L A" = 1, Bos = 2, Lon = 3)
x
names(x)
x$Bos
x["Bos"]
x[["Bos"]]

m <- matrix(1:4, nrow = 2, ncol =2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m
colnames(m) <- c("h", "f")
rownames(m) <- c("x", "y")
m

d <- data.frame(1:4, c("Y", "N", "N", "Y"))
d
names(d) <- c("ID", "Answer")
row.names(d) <- c(101,102,103,104)
d



#6. Getting Data In and Out of R
??read.table()
data <- read.table("Topscored_patient_list.csv", header = TRUE, sep = ",")
data
class(data)
attributes(data)

#Using readr package
library(readr)
teams <- read_csv("data/team_stadnings.csv", col_types ="cc")



##Textual Format to Store Data
##dput()
y <- data.frame(a = 1, b = "a")
dput(y)
y

#dget
y <- data.frame(name = c("Tim", "Mike"), score = c(80, 92))
y
dput(y)
dput(y, file = "y.R")
new_y <- dget("y.R")
new_y


#dump multiple objects
x <- "foo"
y <- data.frame(a = 1L, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x,y)
source("data.R")
str(y)


#binary Formats
a <- data.frame(x = rnorm(100), y = runif(100))
a
b <- c(3, 4.4, 1/3)
b
save(a, b, file = "mydata.rda")
rm(a,b)
load("mydata.rda")

#all objects in the work space
save.image(file = "mydata.RData")
load("mydata.RData")

x <- c(1,3,4,0)
serialize(x,NULL)

x1 <- c("a", "it is simple a test!")
serialize(x1,NULL)


##Interfaces to the outside World
str(file)
str(pnorm)
str(read.csv)
help(pnorm)


con <- url("http://morgan.dartmouth.edu/Docs/60476/", "r")
x <- readline(con)
head(x)


#10 Subsetting R Objects

## 
##Vector
x <- 1:10
x[1]
x[[2]]
x[1:4]
x[c(1,4,5)]
x[x>5]
u <- x > 5
u
x[u]

##List
x <- list(foo = 1:4, bar = 0.6)
x

x[1]  #return a list
x[[1]] #return a vector
x$foo

name <- "foo"
x[[name]]

#nested subset
x <- list(a = list(10, 11, 12), b = c(3.14,2.81))
x[[1]][[3]]
x[[c(1,3)]]
x[["a"]][[3]] #nested element

x[c(1,2)]  #multiple elements

##Matrix
x <- matrix(1:6, 2,3)
x
x[1,2]
x[1,]
x[1,2:3]
x[1,,drop=FALSE]

x[1:2, 1:2][1,1:2]



list <- list(foo = 1:4, z = x)
list[2]
list[[2]]
list$z


##Partial Matching
x <- list(acdse = 1:4, actt = 1, cccc = "test")
x
x[["acd", exact = FALSE]]
x$ac  ##NULL, cause both acdse and actt fits


##Removing NA values
x <- c(1,2,NA,4,NA,5)
nas <- is.na(x)
nas
x[!nas]

x1 <- c(1,2,NA, NA)
x2 <- c(5,NA,4, NA)
both_good <- complete.cases(x1, x2)
both_good
x1[both_good]
x2[both_good]

good <- complete.cases(airquality)   ##values in all columns with valid
head(airquality[good, ])[,1:4]


##Vectorized operations
x <- 1:4
y <- 6:9
z <- x + y
z

z <- numeric(length(x))
for (i in seq_along(x)){
  z[i] <- x[i] + y[i]
}
z

x > 2

x<- matrix(1:4,2,2)
y<- matrix(rep(10,4),2,2)

x * y
x%*%y  ##true matrix multiplication

airquality[airquality$Month == 5,]


##SWIRL
install.packages("swirl")
library(swirl)
install_from_swirl("R Programming")