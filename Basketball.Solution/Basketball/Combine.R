
df.combine <- rbind(df.basketball, df.tennis)

plot(df.combine)

fit <- lm(Wins ~ Seed, data = df.combine)
summary(fit)

getProjectedWins <- function(seed) {
    return(predict(fit, data.frame(Seed = seed)))
}

getProjectedWins(1)

seeds <- data.frame(c(1:16))
names(seeds)[names(seeds) == "c.1.16."] <- "Seed"
seeds$predict <- sapply(seeds$Seed, getProjectedWins)


#1-2 wins 1st 2 games
#3-8 wins 1st game
#9+ goes home
#null hypothesis 1st round
