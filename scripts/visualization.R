library(ggplot2)

#visualize number of rides
all_trips_v2 %>%   
  mutate(weekday = wday(started_at, label = TRUE)) %>%   
  group_by(member_casual, weekday) %>%   
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%   
  arrange(member_casual, weekday) %>%   
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +  
  geom_col(position = "dodge") +
  ggtitle("Number of Rides by Rider Type and Weekday")

#visualize average duration
all_trips_v2 %>%   
  mutate(weekday = wday(started_at, label = TRUE)) %>%   
  group_by(member_casual, weekday) %>%   
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%   
  arrange(member_casual, weekday) %>%   
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +  
  geom_col(position = "dodge")+
  ggtitle("Average Ride Duration by Rider Type and Weekday") 
