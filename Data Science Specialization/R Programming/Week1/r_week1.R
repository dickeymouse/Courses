##R Programming
##Week1

x <- 1
x
print(x)
print(1:100)

#integer
v_integer <- 1L
v_infinit <- Inf

1/v_infinit

##Vector
x <- c(0.5, 0.6)
x <- vector("numeric", length = 10)
x

y <- c(1.7, "a")
y

x <- 0:6
class(x)
as.logical(x)


##matrices
##vectors with dimenion attribute
m <- matrix(1:6, nrow = 2, ncol = 3)
m
dim(m)
attributes(m)

m1 <- 1:10
dim(m1) <- c(2,5)
m1

x <- 1:3
y <- 10:12
cbind(x,y)   ##column bind
rbind(x,y)   ##row bind

##List
x <- list(1, "a", TRUE)
x

x<- vector("list", length = 4)
x


##Factor
x <- factor(c("yes","yes","no","yes"))
x
c("yes","yes","no","yes")

table(x)
unclass(x)   ##see the underlining integer

x1<- factor(c("yes","yes","no"), levels = c("yes","no"))
x1

x2<- factor(c("yes","yes","no"), levels = c("no","yes"))
x2
unclass(x1)
unclass(x2)


##Data Frames
x <- data.frame(foo = 1:4, bar = c(T, T, F, T))
x
attributes(x)


#names
x <- 1:3
names(x) <- c("New York", "Seattle", "Los Angeles")
x
names(x)
attributes(x)

m <- matrix(1:4, nrow = 2, ncol =2)
dimnames(m) <- list(c("a", "b"), c("c", "d"))
m

d <- data.frame(1:4, c("Y", "N", "N", "Y"))
d
names(d) <- c("ID", "Answer")
row.names(d) <- c(101,102,103,104)
d


##Read In
??read.table()
data <- read.table("Topscored_patient_list.csv", header = TRUE, sep = ",")
data
class(data)
attributes(data)

library(readr)


##Textual Format to Store Data
##dput()
y <- data.frame(name = c("Tim", "Mike"), score = c(80, 92))
y
dput(y)
dput(y, file = "y.R")
new_y <- dget("y.R")
new_y


x <- "foo"
y <- data.frame(a = 1L, b = "a")
dump(c("x", "y"), file = "data.R")
rm(x,y)
source("data.R")
str(y)


a <- data.frame(x = rnorm(100), y = runif(100))
a
b <- c(3, 4.4, 1/3)
b
save(a, b, file = "mydata.rda")
rm(a,b)
load("mydata.rda")

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


con <- url("https://www.baidu.com", "r")
x <- readline(con)
head(x)


##Subsetting
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