library(ggplot2)

#movies <- movies
head(movies)
write.csv(
  movies, 
  file = "movies.csv", 
  row.names = FALSE
)

head(movies) 
data_no_na <- subset(movies, !is.na(movies$budget))
nrow(data_no_na)
?movies



