# SELF-STUDY SESSION!!
# Lab 6

# PART 1 - THE BINOMIAL DISTRIBUTION IN R
# A Binomial distribution has been defined by five tosses of a fair coin (i.e. Bin(Size =
# 5, Prob = 0.5)). Use the R-language to compute the following:

# 1.  Use the rbinom() function to generate a simulation of 10,000 observations following the
#     previously y declared binomial distribution, then store these observations into a variable
#     called x.

x <- rbinom(10000,5,0.5)

# 2.  Create a histogram for the random variable x using the hist() function.

hist(x, probability = TRUE, breaks = c(-0.5:5.5))

# 3.  Create a new random variable y, that stores 10 random observations, following the
#     previously declared binomial distribution, Bin(Size = 5, Prob = 0.5).

y <- rbinom(10,5,0.5)

# 4.  Plot the histogram of variable y using the hist() function.

hist(y, probability = TRUE, breaks = c(0.5:5.5))

# 5.  Repeat the steps from 1 to 4. What are the differences you can observe in the new
#     histograms?


# 6.  Use the dbinom() function to find the probability of getting at least 4 heads.

dbinom(x = 4, size = 5, prob = 0.5) + dbinom(x = 5, size = 5, prob = 0.5)
# or
sum(dbinom(x = 4:5, size = 5, prob = 0.5))

# 7.  Use the pbinom() function to find the probability of getting at least 4 heads.

1 - pbinom(q = 3, size = 5, prob = 0.5)

# 8.  Use the rbinom() and the mean() function to find the probability of getting at least 4
#     heads.

z <- rbinom(n = 10000, size = 5, prob = 0.5)
mean(z >= 4)

# 9.  For a disease known to have a complication frequency of 20%, a surgeon suggests a
#     new procedure. She tests it on 10 patients and there are no complications. What is
#     the probability of operating on 10 patients successfully with the traditional method?

dbinom(x = 0, size = 10, prob = 0.2)
# or
dbinom(x = 10, size = 10, prob = 0.8)

# 10. Suppose there are twelve multiple choice questions in IND-123 midterm exam. Each
#     question has five possible answers, and only one of them is correct. Find the probability
#     of having four or less correct answers if a student attempts to answer every question at
#     random.

pbinom(q = 4, size = 12, prob = 0.2)

# In summary: rbinom generates a binomial dist., dbinom gets prob at exactly X = x, pbinom gets cum. prob X <=x


# PART 2 - THE POISSON DISTRIBUTION IN R
# Given that the average number of cars crossing a certain bridge in a 1-minute period is 12.

# 1.  Investigate the ppois() function using the help() function.
# 2.  From the question, set the correct values for x, lambda and lower.tail arguments.
# 3.  What is the probability of having 16 or less cars crossing the bridge in any given
#     minute?

ppois(q = 16, lambda = 12) #lower tail
# If you want 17 or more cars, you look at the upper tail:
ppois(q = 16, lambda = 12, lower.tail = FALSE)

# 4.  What is the probability of no cars crossing the bridge in any given hour?

dpois(x = 0, lambda = 12*60)


# PART 3 THE HYPERGEOMETRIC DISTRIBUTION IN R
# One of the responsibilities of a forest conservation officer is to tag endangered deer for
# preventing illegal hunting. The forest has approximately 400 deer. Last week, 100 deer have
# been captured, tagged, then released. This week the officer captured 125 deer.

# 1.  What is the probability that the officer captured 30 deer of those which have been
#     captured and tagged last week?

choose(100,30) * choose(300,95) / choose(400,125)
# or
dhyper(x = 30, m = 100, n = 300, k = 125)

# 2.  Plot the probability distribution for x, the number of tagged deer in the captured 125
#     deer.

m = 100
n = 300
k = 125
x <- c(0:100)
plot(x, dhyper(x,m,n,k), log="y")

# 3.  What are the mean and variance of the hyper geometric random variable x?

#mean
k * (m/(m+n))

#variance
k * (m/(m+n)) * (1-(m/(m+n))) * (m+n-k) / (m+n-1)



dbinom(20,20,0.5)
