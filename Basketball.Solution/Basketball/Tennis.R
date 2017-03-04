
results <- read.csv(file = "C:/Git/RTA.NCAABasketball.2017/Data/ausopen2017.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ",", dec = ".", quote = "\"", comment.char = "")
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
df.2[df.2$WRank == 4,]
df.2[df.2$LRank == 4,]



df.3 <- data.frame(append(df.2$WRank, df.2$LRank))
colnames(df.3) <- c("ranking")
sort(df.3$ranking)
nrow(df.3)

#make top 4 rankings 1
#next 4 2 etc...




