#PART 2 - Exploratory Analysis in R
# You are out in the market to buy a new car and you have found a list1 of all of the cars in
# the market.

# 1.  Read and Store the online dataset using the read.csv() function into a dataframe
#     structure named cars. You might need to enter the names of the attributes according
#     to the convention followed on the respective website.

url  <- "http://archive.ics.uci.edu/ml/machine-learning-databases/auto-mpg/auto-mpg.data"
cars <- read.csv(file =url,stringsAsFactors=FALSE, sep="", header=FALSE)
names(cars) = c('mpg','cyl','displacement','hp','weight','acc','year','origin','name')

# 2.  Use summary() and str() functions to summarize the statistics of the attributes of the
#     cars dataframe structure. You might need also to look at the first six rows using the
#     head() function.

summary(cars)
str(cars)
head(cars)

# 3.  Probably you noticed that the type of the horsepower attribute, denoted by hp has
#     been classified as character. Use the as.numeric() function to resolve this issue.

cars$hp <- as.numeric(cars$hp)
str(cars)

# 4.  Create a scatter plot using car weight variable weight in the x-axis and acceleration
#     variable acc in the y-axis. You might need to use the plot() function.

plot(cars$weight, cars$acc)

# 5.  To know more about cars and answering: What car should you buy? For that, you
#     might need to introduce a rule-based approach to narrow down the list to one or two
#     cars. These rules are:
#     . Select the cars that have the median acceleration and find the lightest (in terms
#       of weight) ones. Use the which() function to find the list of indices of the cars
#       with an acceleration value equals to the median. Then use which.min() function
#       to find the lightest car from the previous list.

medacc <- which(cars$acc == median(cars$acc))
minwgt <- which.min(cars$weight[medacc])
cars$name[medacc][minwgt]

#     . Select the cars whose weight is closest to the average value of all cars in the
#       dataset. For this rule, compute the difference between each car and the average
#       weight of the cars in the dataset by using the R's built-in mean() function. Next,
#       attach these measurements as a new attribute to the cars dataset. Then find the
#       smallest value in the newly created column by using the which.min() function.
#       You might need to consider applying the abs() function to ignore the negative
#       signs before applying the which.min function.

cars$wgtdiff <- abs(cars$weight - mean(cars$weight))
index <- which.min(cars$wgtdiff)
cars$name[index]



# PART 3 - Control Statements and Loops in R
# Write an R function that takes in a set of numbers (student marks) and determines the
# correspondent grades. Here is the algorithm for this function in a flow-chart diagram.

getgrade <- function(x){
  for (i in 1:length(x)){
    if(x[i] <= 60) {print("Grade = F")}
    else if(x[i] <= 70) {print("Grade = D")}
    else if(x[i] <= 80) {print("Grade = C")}
    else if(x[i] <= 90) {print("Grade = B")}
    else if(x[i] > 90) {print("Grade = A")}
  }
}

getgrade(c(85,96,90))


index <- which(cars$mpg == 18)
subindex <- which.min(cars$weight[index])
cars$name[index][subindex]
