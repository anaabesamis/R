# CIND123 LAB 7
# PART 1 - THE STANDARD NORMAL DISTRIBUTION IN R

# 1.  Use the rnorm() function to generate a sample of size 100 out of the standard normal
#     distribution and store it in a variable called sample1.

sample1 <- rnorm(n=100)

# 2.  Compute the average and standard deviation of the random variable sample1.

mean(sample1)
sd(sample1)

# 3.  Draw a sample of size 100 from a normal distribution with an average equal to 2 and
#     standard deviation equal to 5, then store the sample in a variable called sample2.

sample2 <- rnorm(n=100, mean=2, sd=5)

# 4.  Compute the average and standard deviation of sample2.

mean(sample2)
sd(sample2)

# 5.  Use the dnorm() function to find the y-intercept of the standard normal distribution
#     at x = 1.96.

dnorm(1.96)

# 6.  Assume that the test scores of the CIND-123 midterm exam fits a normal distribution
#     with an average equal to 62, and the standard deviation 14.2. Write an R-command to
#     compute the percentage of students who scored 86 or more in the exam.

1-pnorm(86, mean=62, sd=14.2)
# or
pnorm(q=86, mean=62, sd=14.2, lower.tail=FALSE)

# PART 2 - CONTINUOUS DISTRIBUTIONS IN R
# Joseph and Mohamed often travel to Ryerson University from their job in Mississauga.
# Mohamed tends to drive from the highway, so his arrival to the University follows a normal
# distribution with a mean of 30 minutes and a standard deviation of 3 minutes. Joseph tends
# to prefer side roads so he sometimes gets stuck behind school buses but makes up for the
# lost time by driving faster. His arrival time follows a normal distribution with a mean of 27
# minutes and a standard deviation of 7 minutes. Notably, their travel times are independent
# from each other.

# 1.  Use the dnorm() function to find the y-intercept or the height of the curve in case
#     Joseph arrives in 28.5 minutes. Please note that the answer DOES NOT represent the
#     probability that Joseph arrives in 28.5 minutes.

dnorm(28.5,27,7)

# 2.  How does Joseph's arrival time distribution look like? Plot the time frame from 15 to
#     45 minutes. Use the dnorm() and curve() functions to show your answer.

curve(dnorm(x, mean=27,sd=7), from=15, to=45)

# 3.  Generate a sample of 200 random numbers out of Joseph's normal distribution, then
#     use the hist() function to plot the probability distribution of that sample.

hist(rnorm(200, mean=27, sd=7), freq=F, breaks=c(0:50, by=0.01))

# 4.  Use the qnorm() function to find Mohamed's arrival time that corresponds to the 80th
#     percentile (i.e What is the time of arrival corresponding to 80% of all the arrival times).

qnorm(0.8,mean=30,sd=3)

# 5.  Use the pnorm() function to find the probability that Joseph arrives to the University in
#     1 or less minute, 5 or less minutes, 10 or less minutes, and 15 or less minutes. Notably,
#     the closer we are to the mean, the higher probability we obtain.

pnorm(1,27,7)
pnorm(5,27,7)
pnorm(10,27,7)
pnorm(15,27,7)
