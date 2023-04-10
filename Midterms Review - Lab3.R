install.packages("swirl")
library("swirl")
swirl()

# PART 2 - IMPORTING AND READING DATASETS
# 1.  Download the given dataset lab3dataset.csv then use the read.csv() function to
#     import the file and adjust the function's arguments as follows:
#       . The raw data does not have any headers, so you might need to set the header
#         option to FALSE.
#       . Also, set the stringsAsFactors option to FALSE to make sure that strings will
#         not be treated as factor variables.
#       . Finally, the data has some empty measurements so you might need to set the
#         na.strings option to c("","NA") to replace the blanks and "NA" strings with
#         the logical value NA.

data = read.csv("lab3dataset.csv", header = FALSE, stringsAsFactors = FALSE, na.strings = c("","NA"))

# 2.  Display the first 6 rows of the lab3dataset using the head() function.

head(data)

# 3.  Give proper names to each column using the names() function. Going forward, the
#     exercise will use the following names: ID, Fname, Lname, Email, Gender, Country,
#     Amount, Date.

names(data) <- c("ID", "Fname", "Lname", "Email", "Gender", "Country", "Amount", "Date")
head(data)

# 4.  Use the str() function to see more information about each column.

str(data)

# 5.  Find out how many different countries are there in the dataset by using the unique()
#     function. You might need to remove the NA values before counting the number of unique
#     countries.

length(unique(na.omit(data$Country)))

# 6.  Count the number of Females under the Gender column. You can use the sum()
#     function or a combination of length() and which() functions.

length(which(data$Gender == "Female"))
# or
sum(data$Gender == "Female", na.rm = TRUE)

# 7.  Count the number of NAs under the Gender column.

length(which(is.na(data$Gender)))
# or
sum(is.na(data$Gender))



# PART 3 - PREPARING A WORKING DATASET
# The following steps demonstrate the actions you will have to consider when doing an exploratory analysis.
# 1.  Clean the data by:
#       . Removing clients who have NA as their country name.
#       . Converting the column with dollar values to numeric values.
#       . Converting the Date column to data type date.

data <- data[!is.na(data$Country),]
data$Amount <- as.numeric(gsub("[$,]","",data$Amount))
data$Date <- as.Date(data$Date, "%m/%d/%Y")
head(data)

# 2.  Identify the earliest date in the dataset and calculate the number of days passed for
#     each observation. Insert these values as a new column to the data frame.

min(data$Date)
data$Days <- as.numeric(data$Date - min(data$Date))
head(data)

# 3.  Create an additional column then populate it with a numeric indicator where emails
#     end with .gov, .org, or .net get 1 and the rest get 0.

data$IndEmail <- 0
head(data)
data$IndEmail[grep(".gov", data$Email)] <- 1
data$IndEmail[grep(".org", data$Email)] <- 1
data$IndEmail[grep(".net", data$Email)] <- 1
head(data)

# 4.  (Optional) Check if the calculated number of days and the email indicator can be used
#     to explain the amount column.

lma <- lm(data$Amount ~ data$Days + data$IndEmail)
summary(lma)
