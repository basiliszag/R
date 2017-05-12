# R and redis
Connect to Socket and store data in Redis

Using the script above, one can connect to a socket and parse a data stream.
Then with the use of rredis package, data stream can be stored in redis.
Data stream is one single string per instance, hence package stringr is used in order to split data into key-value format.
Data are then saved into lists (pushing older data to the tail for every new arrival).

