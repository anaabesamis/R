# USING ISwR PACKAGE

# 1.  Before using the dataset bp.obese in ISwR package, let us learn more about one of the
#     basic data structures in R language, being Vectors.
#   (a) Type the following commands at the R prompt (>), then use the class() function
#       to determine the data type of the variable weight.

weight <- c(60, 72, 57, 90, 95, 72, 86, 58)
weight
class(weight)

#   (b) Next, store the following items in a vector called height as follows:

height <- c(1.75, 1.80, 1.65, 1.90, 1.74, 1.91)
height
class(height)

#   (c) Try the following element-wise computation, then display the output after storing
#       it in another vector called bmi. Record your findings.

bmi <- weight/height^2
bmi
class(bmi)

# 2.  Now, let us move to installing and loading the ISwR package, using the following commands:

install.packages("ISwR")
library(ISwR)

# 3.  The ISwR package is a dataset directory that contains example datasets which can be
#     used for statistical analysis. Let us load and display the first 6 rows of the bp.obese
#     dataset which is one of those example datasets. Load the dataset using the data()
#     function, then display the first 6 rows using the head() function.

data("bp.obese")
head(bp.obese)

# 4.  To summarize and overview the structure of the bp.obese dataset, use the summary()
#     and str() functions. Record your findings.

summary(bp.obese)
str(bp.obese)

# 5.  Use the help() function to check out the names and description of the other example
#     datasets in the ISwR package.

help(package = ISwR)

# 6.  Apply the functions listed in Steps 3 and 4 on the Breast Cancer Mortality dataset
#     denoted by bcmort. Record your findings.

data("bcmort")
head(bcmort)
summary(bcmort)
str(bcmort)
