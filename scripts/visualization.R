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


#Refine the visualizations for a better presentation
# Number of rides by rider type and weekday
all_trips_v2 %>%   
  mutate(weekday = wday(started_at, label = TRUE)) %>%   
  group_by(member_casual, weekday) %>%   
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%   
  arrange(member_casual, weekday) %>%   
  ggplot(aes(x = weekday, y = number_of_rides, fill = member_casual)) +  
  geom_col(position = "dodge", width = 0.7) + # Adjusted bar width
  scale_fill_manual(values = c("dodgerblue3", "orange2")) +  # Custom colors
  labs(title = "Number of Rides by Rider Type and Weekday", 
       x = "Weekday", y = "Number of Rides", 
       fill = "Rider Type") +
  theme_minimal() +  # Clean theme
  theme(axis.text.x = element_text(angle = 45, hjust = 1)) 

# Average ride duration by rider type and weekday
all_trips_v2 %>%   
  mutate(weekday = wday(started_at, label = TRUE)) %>%   
  group_by(member_casual, weekday) %>%   
  summarise(number_of_rides = n(), average_duration = mean(ride_length)) %>%   
  arrange(member_casual, weekday) %>%   
  ggplot(aes(x = weekday, y = average_duration, fill = member_casual)) +  
  geom_col(position = "dodge", width = 0.7) +  # Adjusted bar width
  scale_fill_manual(values = c("dodgerblue3", "orange2")) +  # Custom colors
  labs(title = "Average Ride Duration by Rider Type and Weekday", 
       x = "Weekday", y = "Average Duration (minutes)", 
       fill = "Rider Type") +
  theme_minimal() +  # Clean theme
  theme(axis.text.x = element_text(angle = 45, hjust = 1))  # Rotate x-axis labels for readability



# Set the directory for processed files
processed_data_path <- "data/processed/"

# Export the cleaned data to a CSV file
write.csv(all_trips_v2, file = paste0(processed_data_path, "all_trips_v2.csv"), row.names = FALSE)
