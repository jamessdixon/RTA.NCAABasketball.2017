
results <- read.csv(file = "C:/Users/DIXON15/Documents/RTA/Data/ausopen.csv", header = TRUE, row.names = NULL, encoding = "UTF-8", sep = ",", dec = ".", quote = "\"", comment.char = "")
head(results)

df <- data.frame(results$Round, results$WRank, results$LRank)
head(df)






