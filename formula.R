# timeWastedGrading
# Formula for time saved/wasted = ((t*(1+(1-g))) - s) * -1
# where
# s = Minutes assignment should have taken to grade (either your subjective estimate or take the mean for how long it took to grade all papers)
# t = actual amount of time the assignment took to grade
# g = grade

#Negative numbers denote minutes lost/positive numbers minutes saved

#Function for calculating score
time <- function (t, s, g) {
  score <- ((t*(1+(1-g))) - s) * -1
  return(score)
}

# Simulated dataset with average time taken = 15 (SD = 2) and average grade = 80 (SD = .2)
df <- data.frame(s = rep(15, 1000)
                 , t = rnorm(1000, 15, 2)
                 , g = rnorm(1000, .80, .20))

# Calculating time wasted
df$min <- time(df$s,df$t,df$g)

hist(df$min)
summary(df$min)
