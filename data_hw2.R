
df <- data.frame(
  state.name,
  state.abb,
  state.x77,
  state.region,
  state.division,
  row.names = NULL
)

colnames(df) <- c("State", "State_Abv",  "Population", "Income", "Illiteracy", "LifeExp", "Murder", "HS Grads", "Frost",  "Total_Area", "Region", "Division")

head(df)

write.csv(
  df, 
  file = "statex77.csv", 
  row.names = FALSE
)

library(jsonlite)

json <- toJSON(
  df,
  dataframe = "rows",
  factor = "string",
  pretty = TRUE
)
cat(json, file = "state_x77.json")


df_mat <- data.frame(
  #state.name,
  #state.abb,
  state.x77,
  state.region,
  #state.division,
  row.names = NULL
)
df_mat <- df_mat[-c(1,7)]
head(df_mat)
colnames(df_mat) <- c("Income", "Illiteracy", "Life_Expectancy", "Murder", "Percent_High_School_Grads", "Total_Area", "Region")

write.csv(
  df_mat, 
  file = "state_x77_matrix.csv", 
  row.names = FALSE
)
