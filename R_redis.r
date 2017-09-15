con <- socketConnection(host="88.99.38.191", port = 1337, blocking=T,
                          server=FALSE, open="r+")
while(TRUE){
    server_resp <- readLines(con, 1)
    print(server_resp)
  }


################ Store data to redis
library(rredis)
library(stringr) # need this to split key-values into 2 columns

# Connect to Redis
redisConnect(nodelay = F)

# store data stream 
while (TRUE) {
  column <- str_split_fixed(readLines(con,1), ",", 2) # split key-value into 2 columns for parsing
  stockID <- column[1]
  price <- column[2]
  redisRPush(stockID,price)
  }