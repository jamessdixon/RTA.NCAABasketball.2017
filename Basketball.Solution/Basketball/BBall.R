
results <- read.csv(file = "../../Data/TourneyCompactResults.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ",", dec = ".", quote = "\"", comment.char = "")
seeds <- read.csv(file = "../../Data/TourneySeeds.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ",", dec = ".", quote = "\"", comment.char = "")

head(results)
head(seeds)

result.count <- count(results, c("Season", "Wteam"))
head(result.count)

names(result.count)[names(result.count) == "Wteam"] <- "Team"
names(result.count)[names(result.count) == "freq"] <- "Wins"
head(result.count)

df <- merge(x = seeds, y = result.count, by = c("Season","Team"), all.x = TRUE)
head(df)

df[is.na(df)] <- 0
head(df)

df$Seed <- as.character(df$Seed)
str(df$Seed)

#ditch play in game second team
#since they never win, take #1 and their 0 wins
library(stringr)
df.2 <- df[str_sub(df$Seed, 4, -1) != "b",]
df.2$Seed <- substr(df.2$Seed,1,3)
df.2[is.na(df.2)] <- 0

#remove region code and make numeric
df.2$Seed <- str_sub(df.2$Seed, 2, 3)
df.2$Seed <- as.factor(df.2$Seed)
df.2$Seed <- as.integer(df.2$Seed)
head(df.2)

summary(df.2$Seed)
summary(df.2$Wins)

#Champion
df.2[df.2$Wins == 6,]
hist(df.2$Wins)





