

data <- read.csv("/Users/rachanbassi/Documents/Data_Vis/information_visualization/student-mat.csv", header = TRUE)
table(data$absences)

# rename categories in studytime
data$studytime[data$studytime == 1] <- "<2 hours"
data$studytime[data$studytime == 2] <- "2-5 hours"
data$studytime[data$studytime == 3] <- "5-10 hours"
data$studytime[data$studytime == 4] <- ">10 hours"


# group categories in absences
for (i in (1:nrow(data))){  
  #   print(as.numeric(data$absences[i]))
  if (as.numeric(data$absences[i]) >= 0 && as.numeric(data$absences[i]) <= 2) {data$absences[i] <- "<=2 days"}
  else if (as.numeric(data$absences[i]) >= 3 && as.numeric(data$absences[i]) <= 8) {data$absences[i] <- "3-8 days"}
#   else if (as.numeric(data$absences[i]) >= 6 && as.numeric(data$absences[i]) <= 8) {data$absences[i] <- "6-8 days"}
  else if (as.numeric(data$absences[i]) >= 9 && as.numeric(data$absences[i]) <= 11) {data$absences[i] <- "9-11 days"}
  else if (as.numeric(data$absences[i]) >11) {data$absences[i] <- ">12 days"}
}

df <- data.frame(data$studytime, data$absences, data$G3)
names(df) <- c("stime", "abs", "G3")
summary(df$abs)

library(reshape)
?melt
new_df <- melt(df, id = c("stime", "abs"))
new_df1 <- cast(new_df, stime+abs~variable, mean)

# every value in this df will give the average grade for that particular studytime and number of absences
study_abs_grade <-  reshape(new_df1, direction = "wide", idvar = "stime", timevar = "abs", ids = "G3")
# names(study_abs_grade) <-c("abs", "<2 hours",  ">10 hours", "2-5 hours", "10 hours")
names(study_abs_grade) <- c("study_time", "<=2 days", ">12 days", "3-8 days", "9-11 days")


# names(study_abs_grade) <- c("study_time", "<5 days", ">20 days", "11-15 days", "16-20 days", "6-10 days")
# rownames(study_abs_grade) <- study_abs_grade$study_time
# study_abs_grade <- study_abs_grade[-c(1)]
study_abs_grade

write.csv(study_abs_grade, file = "stime_abs_grade_no_nas.csv", row.names = FALSE)



