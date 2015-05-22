
data <- read.csv("/Users/rachanbassi/Documents/Data_Vis/information_visualization/student-mat.csv", header = TRUE)

# df <- data.frame(data$famrel, data$goout, data$Dalc, data$Walc, data$health, data$freetime, data$G3)
# names(df) <- c("famrel", "goout", "Dalc", "Walc", "health", "freetime", "G3")


# group categories in absences
for (i in (1:nrow(data))){  
  #   print(as.numeric(data$absences[i]))
  if (as.numeric(data$absences[i]) >= 0 && as.numeric(data$absences[i]) <= 2) {data$absences[i] <- "1"}
  else if (as.numeric(data$absences[i]) >= 3 && as.numeric(data$absences[i]) <= 6) {data$absences[i] <- "2"}
  else if (as.numeric(data$absences[i]) >= 6 && as.numeric(data$absences[i]) <= 8) {data$absences[i] <- "3"}
  else if (as.numeric(data$absences[i]) >= 9 && as.numeric(data$absences[i]) <= 11) {data$absences[i] <- "4"}
  else if (as.numeric(data$absences[i]) >11) {data$absences[i] <- "5"}
}


df_abs <- data.frame(data$absences, data$G3)
names(df_abs) <- c("absences", "G3")
ddabs <- melt(df_abs, id = c("absences"))
dabs <- cast(ddabs, absences~variable, mean)
names(dabs) <- c("category", "G3")
dabs$feature <- "Absences"


df_fam <- data.frame(data$famrel, data$G3)
names(df_fam) <- c("famrel", "G3")
ddfam <- melt(df_fam, id = c("famrel"))
dfam <- cast(ddfam, famrel~variable, mean)
names(dfam) <- c("category", "G3")
dfam$feature <- "Family Relation"

df_go <- data.frame(data$goout, data$G3)
names(df_go) <- c("goout", "G3")
ddgo <- melt(df_go, id = c("goout"))
dgo <- cast(ddgo, goout~variable, mean)
names(dgo) <- c("category", "G3")
dgo$feature <- "Go out"


df_Dalc <- data.frame(data$Dalc, data$G3)
names(df_Dalc) <- c("Dalc", "G3")
ddDalc <- melt(df_Dalc, id = c("Dalc"))
dDalc <- cast(ddDalc, Dalc~variable, mean)
names(dDalc) <- c("category", "G3")
dDalc$feature <- "Daily Alcohol Consumption"


# df_Walc <- data.frame(data$Walc, data$G3)
# names(df_Walc) <- c("Walc", "G3")
# ddWalc <- melt(df_Walc, id = c("Walc"))
# dWalc <- cast(ddWalc, Walc~variable, mean)

df_health <- data.frame(data$health, data$G3)
names(df_health) <- c("health", "G3")
ddhealth <- melt(df_health, id = c("health"))
dhealth <- cast(ddhealth, health~variable, mean)
names(dhealth) <- c("category", "G3")
dhealth$feature <- "Health"



df_free <- data.frame(data$freetime, data$G3)
names(df_free) <- c("freetime", "G3")
ddfree <- melt(df_free, id = c("freetime"))
dfree <- cast(ddfree, freetime~variable, mean)
names(dfree) <- c("category", "G3")
dfree$feature <- "Free Time"


df <- rbind(dabs, dfam, dgo, dDalc, dhealth, dfree)

write.csv(df, file = "small_multiples_r.csv", row.names = FALSE)


