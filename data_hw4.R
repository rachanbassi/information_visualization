library(ggplot2)

#movies <- movies
head(movies)
write.csv(
  movies, 
  file = "movies.csv", 
  row.names = FALSE
)