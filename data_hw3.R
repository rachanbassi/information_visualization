s<- Seatbelts
s
m = as.list(Seatbelts[,0])
class(m)
m



myts <- ts(Seatbelts, start=c(1969, 1), end=c(1984, 12), frequency=12)
myts
write.csv(
  myts, 
  file = "seatbelts_raw.csv", 
  row.names = FALSE
)

plot(myts)
s <- data.frame(s)
class(s)


write.csv(
  s, 
  file = "seatbelts.csv", 
  row.names = FALSE
)

