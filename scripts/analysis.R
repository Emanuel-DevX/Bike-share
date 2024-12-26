#Data Analysis Process
library(tidyverse)
mean(all_trips_v2$ride_length)    # Average ride length
median(all_trips_v2$ride_length) # Median ride length
max(all_trips_v2$ride_length)    # Longest ride
min(all_trips_v2$ride_length)    # Shortest ride

summary(all_trips_v2$ride_length)

#Compare ride length by rider type
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = mean)    # Mean
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = median)  # Median
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = max)     # Maximum
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual, FUN = min)     # Minimum

#Average ride length by day of the week
aggregate(all_trips_v2$ride_length ~ all_trips_v2$member_casual + all_trips_v2$day_of_week, FUN = mean)

#Reorder days of the week
all_trips_v2$day_of_week <- ordered(all_trips_v2$day_of_week,
                                    levels = c("Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"))

#Analyze ridership by type and weekday
all_trips_v2 %>%   
  mutate(weekday = wday(started_at, label = TRUE)) %>%   # Add weekday column
  group_by(member_casual, weekday) %>%                  # Group by rider type and weekday
  summarise(number_of_rides = n(),                      # Count rides
            average_duration = mean(ride_length)) %>%   # Calculate average duration
  arrange(member_casual, weekday)                       # Sort results

