


data <- read.csv("/Users/rachanbassi/Documents/Data_Vis/information_visualization/student-mat.csv", header = TRUE)

# rename categories in studytime
data$studytime[data$studytime == 1] <- "<2 hours"
data$studytime[data$studytime == 2] <- "2-5 hours"
data$studytime[data$studytime == 3] <- "5-10 hours"
data$studytime[data$studytime == 4] <- ">10 hours"

# group categories in absences
for (i in (1:nrow(data))){  
#   print(as.numeric(data$absences[i]))
if (as.numeric(data$absences[i]) >= 0 && as.numeric(data$absences[i]) <= 5) {data$absences[i] <- "<5 days"}
else if (as.numeric(data$absences[i]) >= 6 && as.numeric(data$absences[i]) <= 10) {data$absences[i] <- "6-10 days"}
else if (as.numeric(data$absences[i]) >= 11 && as.numeric(data$absences[i]) <= 15) {data$absences[i] <- "11-15 days"}
else if (as.numeric(data$absences[i]) >= 16 && as.numeric(data$absences[i]) <= 20) {data$absences[i] <- "16-20 days"}
else if (as.numeric(data$absences[i]) >=21) {data$absences[i] <- ">20 days"}
}

df <- data.frame(data$studytime, data$absences, data$G3)
names(df) <- c("stime", "abs", "G3")
summary(df$abs)

library(reshape)
?melt
new_df <- melt(df, id = c("stime", "abs"))
new_df1 <- cast(new_df, stime+abs~variable, mean)

# every value in this df will give the average grade for that particular studytime and number of absences
study_abs_grade <-  reshape(new_df1, direction = "wide", idvar = "abs", timevar = "stime", ids = "G3")
names(study_abs_grade) <-c("abs", "<2 hours",  ">10 hours", "2-5 hours", "10 hours")

# names(study_abs_grade) <- c("study_time", "<5 days", ">20 days", "11-15 days", "16-20 days", "6-10 days")
# rownames(study_abs_grade) <- study_abs_grade$study_time
# study_abs_grade <- study_abs_grade[-c(1)]

write.csv(study_abs_grade, file = "stime_abs_grade1.csv", row.names = FALSE)

library(jsonlite)
json <- toJSON(study_abs_grade, dataframe = "rows", factor = "string", pretty = TRUE)
cat(json, file = "stime_abs_grade_json.json")
#

##
df$data.absences

df_table <- data.table(df)

df_table[,list(mean=mean(data.G3)),by=data.studytime]
