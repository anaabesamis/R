

# PART 1 - THE USE OF c() AND sum() FUNCTIONS
# This exercise uses a sample of a dataset that identifies the location and area burned for fires
# within the current Prince Albert National Park boundary

# 1.  Use the c() function to create a nominal variable called FireName containing the fire
#     names.

FireName <- c("Waskesiu CFB", "Birch Bay", "Waskesiu CFB", "Wasstrom's Flats", "Millard", "Rabbit", 
              "Sandy North", "Namekus Lake", "Waskesiu CFB", "Millard", "National", "Wasstrom's Guards",
              "South End Meadows")

# 2.  Create a continuousvariable named BurnedArea that contains the values of the burned
#     areas of the fires in the aforementioned table. Do not forget to include the NA logical
#     values.

BurnedArea <- c(40, 0.1, NA, 834, 1483, 20228, NA, 1.2, 56, 693, 0.5, 30, 830)

# 3.  Compute the average of the burned areas using the sum() function.

sum(BurnedArea, na.rm = T) / length(BurnedArea[!is.na(BurnedArea)])



# PART 2 - THE USE OF THE cbind() FUNCTION
# This exercise uses the same data mentioned earlier in Section 1.

# 1.  Create an ordinal variable named Year and enter the values listed in the previous table.

Year <- c("2019", "2019", "2018", "2018", "2018", "2018", "2018", "2018", "2017", "2017", "2017",
          "2017", "2016")
Year <- factor(Year, levels = c("2016", "2017", "2018", "2019"))

# 2.  Use the cbind() function to combine Year, FireName, and BurnedArea variables, and
#     store the results in the variable called Fires.

Fires <- cbind(Year, FireName, BurnedArea)
Fires

# 3.  Explain the limitation of cbind() function in combining variables of different types.

# cbind() will convert all data into one type; string in this case. This IMPLICIT COERCION yields
# undesired results.

# 4.  Practice on extracting rows, columns, and elements of Fires. Use the dim() and
#     nrow() functions to determine the number of attributes in the given dataset.

dim(Fires)
nrow(Fires)
Fires[1,]
Fires[,2]



# PART 3 - WORKING WITH MATRICES
# 1.  Create the following matrix in R and store it in a variable called iMatrix

iMatrix <- matrix(nrow = 3, ncol = 3)
iMatrix
iMatrix[1,] <- c(1,2,3)
iMatrix
iMatrix[2,] <- c(4,2,1)
iMatrix[3,] <- c(2,3,0)
iMatrix

# 2.  Write R-commands to compute the following:
#   (a) The transpose of iMatrix. Notably, the transpose of a matrix is a new matrix
#       whose rows are the columns of the original.

tMatrix <- matrix(nrow = 3, ncol = 3)
tMatrix[,1] <- c(1,2,3)
tMatrix[,2] <- c(4,2,1)
tMatrix[,3] <- c(2,3,0)
tMatrix

t(iMatrix)

#   (b) The inverse of iMatrix. Using either the solve() or ginv() functions

invMatrix <- solve(iMatrix)
invMatrix

#   (C) The multiplication of iMatrix by its inverse.  The outcome should be the identity 
#       matrix  which  is  a  square  matrix  that  has  1's  along  the  main  diagonal  and  0's  for 
#       all  other  entries.

iMatrix %*% invMatrix
