
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


#Start here
#get index and mod%4 for a seed column 

#add in higher name and lower name





