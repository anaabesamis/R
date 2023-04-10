height <- c(84.1, 79.5, 90.9, 95.5, 86.4, 88.6, 68.2, 77.3, 81.8, 79.5)
weight <- c(185.4, 180.3, 190.5, 182.9, 182.9, 190.5, 170.2, 175.3, 180.3, 175.3)

cor(height, weight)

attach(mtcars)
str(mtcars)

# Correlation
cor(mpg, disp)
cor(mpg, wt)

# Scatterplot
plot(mpg, disp)
plot(mpg, wt)

# Test correlation
cor.test(mpg, disp)

# Saving correlation matrix into a table
table_cor_mtcars <- cor(mtcars)
table_cor_mtcars

install.packages("corrplot")
library(corrplot)
corrplot(table_cor_mtcars, method="number")
corrplot(table_cor_mtcars, method="ellipse", type="upper")

# LAB10
# PART 1 - CORRELATION ANALYSIS - USING cats DATASET
# The cats dataset provides information on a sample of domestic cats anatomical data
# and given as part of the MASS package1. The catsdataset contains the following
# attributes:
#   1. Sex sex: Factor with levels F and M.
#   2. Bwt body weight in kg.
#   3. Hwt heart weight in g.

# 1. Install and load the MASS package, then store the cats dataset into a dataframe
# structure called cats.

library(MASS)
data(cats)
str(cats)

# 2. Display a scatter plot to show the relationship of the heart weight against the
# body weight.

plot(cats$Bwt, cats$Hwt)

# 3. Use cor() function to calculate the correlation coefficient for the body weights
# (in kilograms) and heart weights (in grams) given in cats dataset.

cor(cats$Bwt, cats$Hwt,method="pearson")

# 4. Use the mathematical expression to calculate the correlation coefficient for the
# body weights (in kilograms) and heart weights (in grams) given in cats dataset.

x <- cats$Bwt
y <- cats$Hwt
sum((x-mean(x))*(y-mean(y)))/((length(x)-1)*sd(x)*sd(y))

# 5. Describe the relationship between the body weights (in kilograms) and heart weights
# (in grams) in terms of strength and direction.

# STRONG POSITIVE CORRELATION

# 6. Based on the strength of the correlation, can we conclude there is a causal
# relationship between the two variables? Why or why not?

# NO-- CORRELATION DOES NOT IMPLY CAUSATION

# 7. Use the cov() function to find the covariance of the body weights and heart weights.
# What is the mathematical relationship between the Covariance and Correlation?

covariance = cov(cats$Bwt, cats$Hwt, method="pearson")
correlation = covariance / (sd(x)*sd(y))

# 8. What is the mathematical relationship between the correlation coefficient and the
# slope of the best fitted line between two continuous variables. Give an
# illustrative example.

slmodel <- lm(cats$Hwt~cats$Bwt, data=cats)
slmodel
cor(cats$Bwt, cats$Hwt, method="pearson") * sd(cats$Hwt) / sd(cats$Bwt)
# multiply by y (dependent) divided by x(independent)


# PART 2 - CORRELATION ANALYSIS - USING mtcars DATASET
# The mtcars data was extracted from the 1974 Motor Trend US magazine2, and comprises
# fuel consumption and 10 aspects of automobile design and performance for 32 automobiles
# (1973-74 models). The mtcars dataset contains the following attributes:
#   1. mpg Miles/gallon
#   2. cyl Number of cylinders
#   3. disp Displacement (cu.in.)
#   4. hp Gross horsepower
#   5. drat Rear axle ratio
#   6. wt Weight (1000 lbs)
#   7. qsec 1/4 mile time
#   8. vs Engine (0 = V-shaped, 1 = straight)
#   9. am Transmission (0 = automatic, 1 = manual)
#   10. gear Number of forward gears
#   11. carb Number of carburetors

# 1. Load the mtcars dataset using the data() function, then use the summary() function
# to summarize the statistics of the respective attributes.
data(mtcars)
summary(mtcars)

# 2. Use the pairs() function to create a Scatter Plot matrix for the following variables,
# then record the patterns you observe.
#   (a) hp Gross horsepower
#   (b) cyl Number of cylinders
#   (c) gear Number of forward gears
#   (d) mpg Miles/gallon
vars <- c("hp", "cyl", "gear", "mpg")
pairs(mtcars[vars])

# 3. Find the correlation coefficient for the Number of Cylinders cyl and the Gross
# horse-power hp. Is there a significant positive correlation?
cor(mtcars$cyl, mtcars$hp, method="pearson")
cor(mtcars$cyl, mtcars$hp, method="spearman")
# YES-- Strong positive correlation

# 4. Find the correlation coefficient for the Miles/gallon mpg and the Gross horsepower
# hp.Is there a significant negative correlation?
cor(mtcars$mpg, mtcars$hp, method="pearson")
cor(mtcars$mpg, mtcars$hp, method="spearman")
# YES-- Strong negative correlation