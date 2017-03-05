
results <- read.csv(file = "../../Data/ausopen2017.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ",", dec = ".", quote = "\"", comment.char = "")
head(results)
summary(results$Round)

df <- data.frame(results$Winner, results$Loser, results$Round, results$WRank, results$LRank)
head(df)

names(df)[names(df) == "results.Winner"] <- "Winner"
names(df)[names(df) == "results.Loser"] <- "Loser"
names(df)[names(df) == "results.Round"] <- "Round"
names(df)[names(df) == "results.WRank"] <- "WRank"
names(df)[names(df) == "results.LRank"] <- "LRank"

df.2 <- df[df$Round == '2nd Round',]
nrow(df.2)
df.2$Winner <- as.character(df.2$Winner)
df.2$Loser <- as.character(df.2$Loser)
df.2$WRank <- as.integer(df.2$WRank)
df.2$LRank <- as.integer(df.2$LRank)
df.2 <- df.2[order(df.2$WRank),]
df.2

# 2 in the world skipped
# there are 2 #4 ranked players

df.2$highest <- ifelse(df.2$WRank < df.2$LRank, df.2$WRank, df.2$LRank)
df.2 <- df.2[order(df.2$highest),]
df.2

df.0116 <- df.2[1:4,]
df.0215 <- df.2[5:8,]
df.0314 <- df.2[9:12,]
df.0413 <- df.2[13:16,]
df.0512 <- df.2[17:20,]
df.0611 <- df.2[21:24,]
df.0710 <- df.2[25:28,]
df.0809 <- df.2[29:32,]

df.0116$A <- ifelse(df.0116$WRank < df.0116$LRank, df.0116$Winner, df.0116$Loser)
df.0116$AR <- 1
df.0116$B <- ifelse(df.0116$WRank > df.0116$LRank, df.0116$Winner, df.0116$Loser)
df.0116$BR <- 16
df.0116$Winner <- NULL
df.0116$Loser <- NULL
df.0116$Round <- NULL
df.0116$WRank <- NULL
df.0116$LRank <- NULL
df.0116$highest <- NULL

df.0215$A <- ifelse(df.0215$WRank < df.0215$LRank, df.0215$Winner, df.0215$Loser)
df.0215$AR <- 2
df.0215$B <- ifelse(df.0215$WRank > df.0215$LRank, df.0215$Winner, df.0215$Loser)
df.0215$BR <- 15
df.0215$Winner <- NULL
df.0215$Loser <- NULL
df.0215$Round <- NULL
df.0215$WRank <- NULL
df.0215$LRank <- NULL
df.0215$highest <- NULL

df.0314$A <- ifelse(df.0314$WRank < df.0314$LRank, df.0314$Winner, df.0314$Loser)
df.0314$AR <- 3
df.0314$B <- ifelse(df.0314$WRank > df.0314$LRank, df.0314$Winner, df.0314$Loser)
df.0314$BR <- 14
df.0314$Winner <- NULL
df.0314$Loser <- NULL
df.0314$Round <- NULL
df.0314$WRank <- NULL
df.0314$LRank <- NULL
df.0314$highest <- NULL

df.0413$A <- ifelse(df.0413$WRank < df.0413$LRank, df.0413$Winner, df.0413$Loser)
df.0413$AR <- 4
df.0413$B <- ifelse(df.0413$WRank > df.0413$LRank, df.0413$Winner, df.0413$Loser)
df.0413$BR <- 13
df.0413$Winner <- NULL
df.0413$Loser <- NULL
df.0413$Round <- NULL
df.0413$WRank <- NULL
df.0413$LRank <- NULL
df.0413$highest <- NULL

df.0512$A <- ifelse(df.0512$WRank < df.0512$LRank, df.0512$Winner, df.0512$Loser)
df.0512$AR <- 5
df.0512$B <- ifelse(df.0512$WRank > df.0512$LRank, df.0512$Winner, df.0512$Loser)
df.0512$BR <- 12
df.0512$Winner <- NULL
df.0512$Loser <- NULL
df.0512$Round <- NULL
df.0512$WRank <- NULL
df.0512$LRank <- NULL
df.0512$highest <- NULL

df.0611$A <- ifelse(df.0611$WRank < df.0611$LRank, df.0611$Winner, df.0611$Loser)
df.0611$AR <- 6
df.0611$B <- ifelse(df.0611$WRank > df.0611$LRank, df.0611$Winner, df.0611$Loser)
df.0611$BR <- 11
df.0611$Winner <- NULL
df.0611$Loser <- NULL
df.0611$Round <- NULL
df.0611$WRank <- NULL
df.0611$LRank <- NULL
df.0611$highest <- NULL

df.0710$A <- ifelse(df.0710$WRank < df.0710$LRank, df.0710$Winner, df.0710$Loser)
df.0710$AR <- 7
df.0710$B <- ifelse(df.0710$WRank > df.0710$LRank, df.0710$Winner, df.0710$Loser)
df.0710$BR <- 10
df.0710$Winner <- NULL
df.0710$Loser <- NULL
df.0710$Round <- NULL
df.0710$WRank <- NULL
df.0710$LRank <- NULL
df.0710$highest <- NULL

df.0809$A <- ifelse(df.0809$WRank < df.0809$LRank, df.0809$Winner, df.0809$Loser)
df.0809$AR <- 8
df.0809$B <- ifelse(df.0809$WRank > df.0809$LRank, df.0809$Winner, df.0809$Loser)
df.0809$BR <- 9
df.0809$Winner <- NULL
df.0809$Loser <- NULL
df.0809$Round <- NULL
df.0809$WRank <- NULL
df.0809$LRank <- NULL
df.0809$highest <- NULL

df.seeds <- data.frame(df.0116$A, df.0116$AR)
names(df.seeds)[names(df.seeds) == "df.0116.A"] <- "Player"
names(df.seeds)[names(df.seeds) == "df.0116.AR"] <- "Seed"
df.seed16 <- data.frame(df.0116$B, df.0116$BR)
names(df.seed16)[names(df.seed16) == "df.0116.B"] <- "Player"
names(df.seed16)[names(df.seed16) == "df.0116.BR"] <- "Seed"

df.seed02 <- data.frame(df.0215$A, df.0215$AR)
names(df.seed02)[names(df.seed02) == "df.0215.A"] <- "Player"
names(df.seed02)[names(df.seed02) == "df.0215.AR"] <- "Seed"
df.seed15 <- data.frame(df.0215$B, df.0215$BR)
names(df.seed15)[names(df.seed15) == "df.0215.B"] <- "Player"
names(df.seed15)[names(df.seed15) == "df.0215.BR"] <- "Seed"

df.seed03 <- data.frame(df.0314$A, df.0314$AR)
names(df.seed03)[names(df.seed03) == "df.0314.A"] <- "Player"
names(df.seed03)[names(df.seed03) == "df.0314.AR"] <- "Seed"
df.seed14 <- data.frame(df.0314$B, df.0314$BR)
names(df.seed14)[names(df.seed14) == "df.0314.B"] <- "Player"
names(df.seed14)[names(df.seed14) == "df.0314.BR"] <- "Seed"

df.seed04 <- data.frame(df.0413$A, df.0413$AR)
names(df.seed04)[names(df.seed04) == "df.0413.A"] <- "Player"
names(df.seed04)[names(df.seed04) == "df.0413.AR"] <- "Seed"
df.seed13 <- data.frame(df.0413$B, df.0413$BR)
names(df.seed13)[names(df.seed13) == "df.0413.B"] <- "Player"
names(df.seed13)[names(df.seed13) == "df.0413.BR"] <- "Seed"

df.seed05 <- data.frame(df.0512$A, df.0512$AR)
names(df.seed05)[names(df.seed05) == "df.0512.A"] <- "Player"
names(df.seed05)[names(df.seed05) == "df.0512.AR"] <- "Seed"
df.seed12 <- data.frame(df.0512$B, df.0512$BR)
names(df.seed12)[names(df.seed12) == "df.0512.B"] <- "Player"
names(df.seed12)[names(df.seed12) == "df.0512.BR"] <- "Seed"

df.seed06 <- data.frame(df.0611$A, df.0611$AR)
names(df.seed06)[names(df.seed06) == "df.0611.A"] <- "Player"
names(df.seed06)[names(df.seed06) == "df.0611.AR"] <- "Seed"
df.seed11 <- data.frame(df.0611$B, df.0611$BR)
names(df.seed11)[names(df.seed11) == "df.0611.B"] <- "Player"
names(df.seed11)[names(df.seed11) == "df.0611.BR"] <- "Seed"

df.seed07 <- data.frame(df.0710$A, df.0710$AR)
names(df.seed07)[names(df.seed07) == "df.0710.A"] <- "Player"
names(df.seed07)[names(df.seed07) == "df.0710.AR"] <- "Seed"
df.seed10 <- data.frame(df.0710$B, df.0710$BR)
names(df.seed10)[names(df.seed10) == "df.0710.B"] <- "Player"
names(df.seed10)[names(df.seed10) == "df.0710.BR"] <- "Seed"

df.seed08 <- data.frame(df.0809$A, df.0809$AR)
names(df.seed08)[names(df.seed08) == "df.0809.A"] <- "Player"
names(df.seed08)[names(df.seed08) == "df.0809.AR"] <- "Seed"
df.seed09 <- data.frame(df.0809$B, df.0809$BR)
names(df.seed09)[names(df.seed09) == "df.0809.B"] <- "Player"
names(df.seed09)[names(df.seed09) == "df.0809.BR"] <- "Seed"

df.seeds <- rbind(df.seeds, df.seed16)
df.seeds <- rbind(df.seeds, df.seed02)
df.seeds <- rbind(df.seeds, df.seed15)
df.seeds <- rbind(df.seeds, df.seed03)
df.seeds <- rbind(df.seeds, df.seed14)
df.seeds <- rbind(df.seeds, df.seed04)
df.seeds <- rbind(df.seeds, df.seed13)
df.seeds <- rbind(df.seeds, df.seed05)
df.seeds <- rbind(df.seeds, df.seed12)
df.seeds <- rbind(df.seeds, df.seed06)
df.seeds <- rbind(df.seeds, df.seed11)
df.seeds <- rbind(df.seeds, df.seed07)
df.seeds <- rbind(df.seeds, df.seed10)
df.seeds <- rbind(df.seeds, df.seed08)
df.seeds <- rbind(df.seeds, df.seed09)

nrow(df.seeds)
df.tourny <- df[df$Round != '1st Round',]

getNumberofWins <- function(playerName) {
    wins <- df.tourny[df.tourny$Winner == playerName,]
    return(nrow(wins))
}

df.seeds$Wins <- sapply(df.seeds$Player, getNumberofWins)

df.tennis <- df.seeds
df.tennis$Player <- NULL
hist(df.tennis$Wins)

head(df.tennis)

library(plyr)
ddply(df.tennis, ~ Seed, summarise, mean = mean(Wins), sd = sd(Wins))

