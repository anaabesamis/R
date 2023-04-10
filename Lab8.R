# CIND123 LAB 8

# PART 1 - SAMPLING DISTRIBUTIONS
# 1.  Given a vector of three numbers x = c(5, 10, 15), use the permutation() function
#     to generate all possible outcomes for two selected numbers (replacement is allowed).
#     Please consider installing the gtools Package as permutations() function is part of
#     it.

install.packages("gtools")
library(gtools)
x <- c(5,10,15)
perm <- permutations(length(x), 2, x, repeats.allowed = TRUE)
perm

# 2.  Use the rowMeans() function to calculate the average of each possible pair generated
#     in the previous step.

mean_perm <- rowMeans(perm)
mean_perm

# 3.  Check whether the average of all the averages of all permutations (i.e. mean perm) is
#     equal to the average of the main vector (population) from which the samples have been
#     withdrawn.

mean(rowMeans(perm)) == mean(x)

# 4.  Use the hist() function to plot a histogram of the pairs' averages.

hist(mean_perm, probability = TRUE, breaks=c(0:20))


# PART 2 - DISCRETE DISTRIBUTIONS CONVERGENCE
# Prove the following statements using rpois(), rbinom(), rnorm(), and hist() functions.

# . When the sample set is large, Poisson distribution with lambda n converges to Normal
#   distribution with mean n and variance n.

par(mfrow=c(1,2)) #puts both histogram together! c(row,column); so cool !!
hist(rpois(n=100000, lambda=20), freq=FALSE)
hist(rnorm(n=100000, mean=20, sd=20^0.5), freq=FALSE)
# sd = sqrt(lambda)

# . When the sample set is large, Binomial distribution with n trials and a probability with
#   p converges to a Normal distribution with mean n ??? p and variance n ??? p ??? (1 p).

par(mfrow=c(1,2))
hist(rbinom(n=100000, size=20, prob=0.4), freq=FALSE)
hist(rnorm(n=100000, mean=20*0.4, sd=(20*0.4*(1-0.4))^0.5), freq=FALSE)


# PART 3 - CENTRAL LIMIT THEOREM SIMULATION
# Open a new script in R and enter function

#Central Limit Theorem Simulation
sdm.sim <- function(n,src.dist=NULL,param1=NULL,param2=NULL) {
  r <- 10000 # Number of replications/samples - Not to be adjusted
  # This produces a matrix of observations with
  # n columns and r rows. Each row is one sample:
  my.samples <- switch(src.dist,
                       "E" = matrix(rexp(n*r,param1),r),
                       "N" = matrix(rnorm(n*r,param1,param2),r),
                       "U" = matrix(runif(n*r,param1,param2),r),
                       "P" = matrix(rpois(n*r,param1),r),
                       "C" = matrix(rcauchy(n*r,param1,param2),r),
                       "B" = matrix(rbinom(n*r,param1,param2),r),
                       "G" = matrix(rgamma(n*r,param1,param2),r),
                       "X" = matrix(rchisq(n*r,param1),r),
                       "T" = matrix(rt(n*r,param1),r))
  all.sample.sums <- apply(my.samples,1,sum)
  all.sample.means <- apply(my.samples,1,mean)
  all.sample.vars <- apply(my.samples,1,var)
  par(mfrow=c(2,2))
  hist(my.samples[1,],col="gray", freq = F,
       main="Distribution of One Sample")
  hist(all.sample.sums,col="gray", freq = F,
       main="Sampling Distribution of Sum")
  hist(all.sample.means,col="gray", freq = F,
       main="Sampling Distribution of Mean")
  hist(all.sample.vars,col="gray",
       main="Sampling Distribution of Variance")}

# 1.  (Normal Distribution) Call the previously declared function sdm.sim with n = 20
#     and a sample withdrawn from a Normal distribution of mean 20 and standard distribution of 3.
#     . Change the sample size from 20 to 40, then from 40 to 60. Continue incrementing
#       the sample size by 20 till you reach 100, and every time call the sdm.sim function
#       with the new parameters and record any key findings.
#     . Change the mean of the normal distribution and the standard deviation, then call
#       the sdm.sim function with the new parameters and record any key findings.

sdm.sim(20, src.dist="N", param1=20, param2=3)

# "explains what the fxn is doing to get the histograms???"
set.seed(3)
matrix(rnorm(n*r, param1, param2),r)
my.sample_test = matrix(rnorm(10*10000,20,3),10000)
dim(my.sampl)
my.sampl[1,]
(apply(my.sampl,1,sum))

sdm.sim(60, src.dist="N", param1=20, param2=3)


# 2.  (Poisson Distribution) Call the previously declared function sdm.sim with n = 20
#     and a sample withdrawn from a Poisson distribution of mean 10.
#     . Change the sample size from 20 to 40, then from 40 to 60. Continue incrementing
#       the sample size by 20 till you reach 100, and every time call the sdm.sim function
#       with the new parameters and record any key findings.
#     . Change the mean of the Poisson distribution then call the sdm.sim function with
#       the new parameters and record any key findings.

sdm.sim(20, src.dist="P", param1=10)

# 3.  (Binomial Distribution) Call the previously declared function sdm.sim with n = 20
#     and a sample withdrawn from a Binomial distribution of size 10 and success probability
#     of 0.1 (Extremely Skewed Distribution)
#     . Change the sample size from 20 to 40, then from 40 to 60. Continue incrementing
#       the sample size by 20 till you reach 100, and every time call the sdm.sim function
#       with the new parameters and record any key findings.
#     . Change the probability of success to 0.5 or 0.9 of the Binomial distribution then
#       call the sdm.sim function with the new parameters and record any key findings.

sdm.sim(20, src.dist="B", param1=10, param2=0.1)
