# PART 1 - REVISITING swirl PACKAGE


# PART 2 - CREATE AND CALL FUNCTIONS IN R
# 1.  Create a function that calculates the average of a set of numbers (without using the R
#     mean() function. The function should take a set of numbers as an input, and return
#     the average as an output. Give an illustrative example.

avef <- function(x){
  sum(x, na.rm = TRUE)/length(na.omit(x))
}

# 2.  Create a function that calculates the relative standing measure z-score of a specific
#     value. The function should take in two arguments: a single value, and a set of numbers,
#     and return the z-score of that single value. Give an illustrative example.

zsc <- function(x,y){
  (x - avef(y)) / sd(y)
}

y <- c(42, 41, 47, 40, 41, 39, 37, 38, 48, 38, 33, 40, 36, 40, 38, 38, 46, 38, 38, 33)

convert2zscores <- function(y) {
  muy <- mean(y)
  sdy <- sd(y)
  zscores <- y/sdy
  return(zscores)
}

# 3.  Download the given dataset lab4dataset.csv then use the read.csv() function to
#     import the file and adjust the function's arguments as follows:
#       . Set the stringsAsFactors option to FALSE to make sure that strings will not be
#         treated as factor variables.
#       . Set the sep option to , as the values in the columns are comma delimited.
#       . Finally, the data has some empty measurements so you might need to set the
#         na.strings option to c("","NA") to replace the blanks and "NA" strings with
#         the logical value NA.

lab4data <- read.csv("lab4dataset.csv", sep = ",", stringsAsFactors = FALSE, na.strings = c("", "NA"))

# 4.  Use the str() function to see more information about each attribute.

str(lab4data)

# 5.  Assuming the dataset represents house prices and clients are usually concern with the
#     maximum price they are willing to spend on a house. With this maximum price, create
#     a function that returns a vector with 2 elements: i) the number of available houses
#     at/below that price, and ii) the ratio of the number of those houses to the total number
#     of the houses in the given dataset. Give an illustrative example.

house <- function(maxprice){
  x = sum(lab4data$price <= maxprice)
  y = x / length(lab4data$price)
  return(c(x,y))
}
house(45000)

# 6.  Create a function that takes in a set of numbers and plots it in a histogram, and returns
#     1 if the set is skewed to the right, and -1 if it is skewed to the left. Use this function to
#     plot and determine the skewness of the prices.

skewness <- function(x){
  hist(x, freq = F, breaks = 100)
  return(sign(average(x) - median(x)))
}
skewness(lab4data$price)

# 7.  (Optional) Create a function that has price as an input, and returns the z-score of the
#     average number of bath-pieces (denoted by bathp in the dataset) for houses less than
#     or equal to the inputted price. Also make it display a summary for the number of bath
#     pieces for houses at or below the inputted price. Give an illustrative example.

bath <- function(price){
  print(summary(lab4data$bathp[lab4data$price<=price]))
  return(zscore(average(lab4data$bathp[lab4data$price<=price]), lab4data$bathp)) 
}
bath(49120)

# 8.  Create a function that takes in a higher price and lower price as two arguments and
#     creates a subset of houses that falls into that interval, then returns the first six rows of
#     that subset.

range <- function(maxprice, minprice){
  subset <- lab4data[which(lab4data$price >= minprice & lab4data$price <= maxprice),]
  return(head(subset))
}
range(50000,25000)

# 9.  Clients are interested in bath-pieces. Create a function that has an input as the number
#     of bath-pieces, and returns a subset of the cheapest house(s) that have that number of
#     bath-pieces.

bathpiece <- function(pieces) 
{ 
  bath <- 0 
  bath <-lab4data[which(lab4data$bathp == pieces),] 
  bath = bath[bath$price == min(bath$price),] 
  return(bath) 
}
#Example 
bathpiece(4)

