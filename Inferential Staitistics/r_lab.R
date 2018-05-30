# Vector containing the amount of money you gave participants (predictor)
money  <- c(1, 2, 3, 4, 5, 6, 7, 8, 9, 10)

# Vector containing the amount the participants liked you (response)
liking <- c(2.2, 2.8, 4.5, 3.1, 8.7, 5.0, 4.5, 8.8, 9.0, 9.2)

# Correlation between money and liking
cxy <- cor(money, liking)

# Standard deviation of money
sx <- sd(money)

# Standard deviation of liking
sy <- sd(liking)

# Calculate the the regression slope using cxy, sx and sy
cxy * sy / sx

intercept <- mean(liking) - (0.778 * mean(money))
intercept

lm(liking ~ money)
