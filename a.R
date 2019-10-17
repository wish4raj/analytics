# Data Structures in R

# vectors----

# matrix----

#dataframe----

v1=10

v1
print(v1)
v2 = 1:100
v2

(v3=c(1,6,4,10)) # create and print simultaneously

v4=seq(1,100,5)
v4
v5 = c("A", "Vishal", "IIFT")
v5
class(v5)
(v6 = 1:100000)
(v7=rnorm(100, mean=60, sd=10))
mean(v7)
sd(v7)
v7
v7[1:10] # positions

v7[seq(1,100,5)]

v7[v7>50]

v7[v7>70 | v7<60] # or function operation

mean (v7[v7>70 | v7<60])


plot (v7)

hist(v7)


plot(density(v7))

hist(v7,breaks=15)


quantile(v7)

summary (v7)

quantile(v7, seq(0,1,.1))

quantile(v7,seq(0,1,0.01))


sort(v7, decreasing = TRUE)


#matrix----

(data= 24:1)


v12 = c(1,3,"A")

v12 # all data became character
v13 =1:10

v13+1



v13^2
v13/sum(v13)


m1 = matrix (data)
m1
(m2=matrix (data, nrow=4)) # data heve 24 values by default

(m2=matrix (data, nrow=4, byrow=T)) # data heve 24 values by default
?matrix

m2[1,]
m2[,1]

m2[,c(1,3)]

m2[c(1,4),c(2,4,5)]
m2
rowSums(m2)
colSums(m2)
rowMeans(m2)
colMeans(m2)


m2


table(mtcars$cyl)
table(mtcars$cyl,mtcars$gear, dnn = c ("cyl","gear"))

t1=table(mtcars$cyl,mtcars$gear, dnn = c ("cyl","gear"))

t1
margin.table(t1)

margin.table(t1, margin = 1)

?margin.table


margin.table(t1, margin = 2)


addmargins(t1)
addmargins(t1, FUN = mean )
t1

?addmargins
?margin.table

addmargins(t1,FUN = list(list(mean,sum), list(sd,var)))



sweep(m2, MARGIN = 1,STATS = 4, FUN = "*") # margin = 1 Row wise , 2 for column


sweep(m2, MARGIN = 1,STATS = c(1,2,3,4), FUN = "*") # margin = 1 Row wise , 2 for column


sweep(m2, MARGIN = 2,STATS = c(1,2,3,4,5,6), FUN = "*") # margin = 1 Row wise , 2 for column

m2
#dataframe----


mtcars
data()
AirPassengers
class(mtcars)
head(mtcars,n=3)
tails(mtcars)

dim(mtcars) # dimensions
 nrow(mtcars) # number of rows
names(mtcars) # names of the columns
rownames(mtcars) #rownames
head(mtcars)
summary(mtcars)


#summarising / filter data from DF

summary(mtcars)
mtcars

mtcars[mtcars$gear==4,]

mtcars[mtcars$gear==4 & mtcars$mpg > 25, c("mpg","gear","cyl")]

mtcars[mtcars$gear==4 & mtcars$mpg < 25, c("mpg","gear","cyl")]
mtcars

mtcars[order(mtcars$mpg),]



head(mtcars)
mtcars[row.names(mtcars)=="Mazda RX4",]

mtcars[c(1,3,4), c(1,5)]
# export to csv

mtcars
write.csv(mtcars,"vishal.csv")
df1 = read.csv("vishal.csv")
head(df1)
names(df1)
write.csv(mtcars,"vishal1.csv",row.names = F)
df2=read.csv("vishal1.csv")
head(df2)
(carnames = paste("car",1:32,sep = ":"))

df2$cars=carnames
head(df2)




# create data frame from scratch



# rollno, name, gender, marks, grade

(rollno=1:30)
(name = paste("student",1:30))
rep("M",3)
rep(c("M","F"),c(4,3))
(gender = sample(c("M","F"),size = 30, replace = T))

(gender = sample(c("M","F"),size = 30, replace = T, prob = c(.6,.4)))
table(gender)
prop.table(table(gender))

set.seed(123)
(gender = sample(c("M","F"),size = 30, replace = T))
prop.table(table(gender))


prop.table(table(gender))


prop.table(table(gender))

marks = runif(30,min=50, max=100)
marks
x= c(-14.45,-14.67,14.45,14.67)
x
trunc(x) # step function

round(x,1)

floor(x)

ceiling(x)
( grades = sample(c("A","B","C"),size = 30, replace=T, prob = c(0.3,0.45,0.25)))

#(A-30, B-45, C-25)

table(grades)
prop.table(table(grades))
rollno;name;gender;marks;grades

students = data.frame (rollno,name, gender, marks,grades)
head(students)
str(students)
summary(students)

students$name=as.character(students$name)
str(students)
summary(students)
students$grades=factor(students$grades,ordered = T,levels = c("C","B","A"))
students$grades
table(students$grades)

barplot(table(students$grades), col = 1:3)
hist(students$marks)
hist(students$marks, breaks = c(0,70,90,100))
range(students$marks)

students
students[students$gender== "M" & students$marks>70,]

library(dplyr)
#
students%>% filter(gender == "M" & marks>70) %>% arrange(marks)



