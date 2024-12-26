library(tidyverse)
mean(all_trips_v2$ride_length)    # Average ride length
median(all_trips_v2$ride_length) # Median ride length
max(all_trips_v2$ride_length)    # Longest ride
min(all_trips_v2$ride_length)    # Shortest ride

summary(all_trips_v2$ride_length)

aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)    # Mean
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)  # Median
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)     # Maximum
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)     # Minimum
