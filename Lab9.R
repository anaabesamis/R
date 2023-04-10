# CIND123 LAB 9

# PART 1 - Simple Linear Model - Using cats Dataset
# The cats dataset provides information on a sample of domestic cats anatomical data and
# given as part of the MASS package1. The catsdataset contains the following attributes:
# 1. Sex sex: Factor with levels F and M.
# 2. Bwt body weight in kg.
# 3. Hwt heart weight in g.

# 1.  Install and load the MASS package, then store the cats dataset into a dataframe
#     structure called cats.
library(MASS)
data(cats)
str(cats)

# 2.  Create a simple linear model where heart weight is the dependent variable and body
#     weight is the independent variable. What is the intercept and the slope of this
#     model? How would you interpret the slope of this model?
slmodel <- lm(Hwt~Bwt, data=cats)
summary(slmodel)
# hwt = -0.3567 + 4.0341 *bwt

# 3.  Display a scatter plot to show the relationship of the heart weight against the body
#     weight.
par(mfrow=c(1,2))
plot(cats$Bwt, cats$Hwt)

# 4.  Use the abline() function to show the simple linear model created in step 2, then
#     use the with() and points() functions to distinguish the sex of the cats in the
#     scatter plot.
dev.off()
plot(cats$Bwt, cats$Hwt, las=1, type="n")
abline(lm(Hwt~Bwt, data=cats))
with(cats, points(Bwt[Sex=="F"], Hwt[Sex=="F"], pch=16, col="red"))
with(cats, points(Bwt[Sex=="M"], Hwt[Sex=="M"], pch=17, col="blue"))

# 5.  Use the simple linear model slmodel to predict the heart weight of a cat that is 3.7
#     kilograms. Compute the difference between the observed and expected values
temp.df <- data.frame(Bwt=c(3.7))
predict(slmodel, temp.df)

#Expected value is:
cats[which(cats$Bwt == 3.7),]

        
# PART 2 - Simple Linear Model - Using mtcars Dataset
# The mtcars data was extracted from the 1974 Motor Trend US magazine2, and comprises
# fuel consumption and 10 aspects of automobile design and performance for 32 automobiles
# (1973-74 models). The mtcars dataset contains the following attributes:
# 1. mpg Miles/gallon
# 2. cyl Number of cylinders
# 3. disp Displacement (cu.in.)
# 4. hp Gross horsepower
# 5. drat Rear axle ratio
# 6. wt Weight (1000 lbs)
# 7. qsec 1/4 mile time
# 8. vs Engine (0 = V-shaped, 1 = straight)
# 9. am Transmission (0 = automatic, 1 = manual)
# 10. gear Number of forward gears
# 11. carb Number of carburetors

# 1.  Load the mtcars dataset using the data() function, then use the lm() function to
#     create two simple linear models: The first explains the Miles/gallon mpg attribute
#     using the Gross horsepower hp, and the second explains the Miles/gallon using the
#     Weight of the car.
data(mtcars)
summary(mtcars)

# 2.  Which linear model of the geerated models in Step 1 is best to explain the variance
#     of the values in the Miles/gallon mpg attribute? Explain.
model1 = lm(formula = mpg ~ hp, data = mtcars)
model2 = lm(formula = mpg ~ wt, data = mtcars)

summary(model1) # mpg = 30.09886 - 0.06823(hp)
summary(model2) # mpg = 37.2851 - 5.3445(wt)

# PART 3 - Multiple Linear Model - Using Wage Dataset
# The Wage data is included in the ISLR package3, and comprises 3000 observations on the
# following 11 variables.
# 1. year Year that wage information was recorded
# 2. age Age of worker
# 3. maritl A factor with 5 levels indicating marital status
# 4. race A factor with levels 1. White 2. Black 3. Asian and 4. Other indicating race
# 5. education A factor with levels 1. <HS Grad 2. HS Grad 3. Some College 4. College
# Grad and 5. Advanced Degree indicating education level
# 6. region Region of the country (mid-atlantic only)
# 7. jobclass A factor with levels 1. Industrial and 2. Information indicating type of job
# 8. health A factor with levels 1. <=Good and 2. >=Very Good indicating health level
# of worker
# 9. health ins A factor with levels 1. Yes and 2. No indicating whether worker has health
# insurance
# 10. logwage Log of workers wage
# 11. wage Workers raw wage

# 1.  Load the Wage dataset using the data() function, then use the lm() function to create
#     a multiple linear model to explain the variance in the wage variable using three
#     independent variables: two are categorical variables (e.g. education and jobclass)
#     and the third is a quantitative variable (e.g. age).
install.packages('ISLR')
library(ISLR)
data(Wage)
str(Wage)

lm(wage~age+education, data=Wage)
head(Wage)
mlmodel <- lm(wage~education+jobclass+age, data=Wage)

# 2.  Summarize the model using the summary() function.
summary(mlmodel)

# 3.  Why does the education variable transform into only four variables rather than five
#     variables?

# Because 1 (<HS Grad) is the benchmark to compare the other 4 variables with.