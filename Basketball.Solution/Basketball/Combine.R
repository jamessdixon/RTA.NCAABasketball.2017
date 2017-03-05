
df.combine <- rbind(df.basketball, df.tennis)

plot(df.combine)

oneSeed <- df.combine[df.combine$Seed == 1,]
oneSeed$Wins <- as.factor(oneSeed$Wins)
plot(oneSeed$Wins)

fit <- lm(Wins ~ Seed, data = df.combine)
summary(fit)

getProjectedWins <- function(seed) {
    return(predict(fit, data.frame(Seed = seed)))
}

getProjectedWins(1)

seeds <- data.frame(c(1:16))
names(seeds)[names(seeds) == "c.1.16."] <- "Seed"
seeds$predict <- sapply(seeds$Seed, getProjectedWins)
seeds$predict

#Outliers
install.packages("DMwR")
library(DMwR)
outlier.scores <- lofactor(seeds, k = 5)
plot(density(outlier.scores))
outliers <- order(outlier.scores, decreasing = T)[1:16]
n <- nrow(seeds)
labels <- 1:n
labels[ - outliers] <- "."
biplot(prcomp(seeds), cex = .8, xlabs = labels)

#Boxplot
boxplot(Wins ~ Seed, data = df.combine, maintainer = 'Tourny Results', xlab = 'Seed', ylab = 'Wins')

#Normal
#Need 1 with 6 wins from 1 or 2 seed
#Need 1 more with 5 wins from 1,2,5,6 seed
#Need 2 more with 4 wins from 1,2,5,6 seed
#Need 4 more with 3 wins from 1-6 seeds
#Need 8 more with 2 wins from 1-12 seeds
#Need 16 with 1 win from 1-12 seeds
#Need 32 with 0 wins from 5-16 seeds

#Madness
#Need 1 with 6 wins from 1-8 seed
#Need 1 more with 5 wins from 1-8 seed
#Need 2 more with 4 wins from 1-11 seed
#Need 4 more with 3 wins from 1-12 seeds
#Need 8 more with 2 wins from 1-15 seeds
#Need 16 with 1 win from 1-16 seeds
#Need 32 with 0 wins from 1-16 seeds



