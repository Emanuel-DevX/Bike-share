
install.packages('tidyverse')
library(tidyverse)
data_2019 <- read.csv("data/raw/Divvy_Trips_2019_Q1.csv")
head(data_2019)
View(data_2019)

data_2020 <- read.csv("data/raw/Divvy_Trips_2020_Q1.csv")
head(data_2020)
View(data_2020)

colnames(data_2019)  
colnames(data_2020)

data_2019 <- rename(data_2019, 
                  ride_id = trip_id,
                  rideable_type = bikeid,
                  started_at = start_time,
                  ended_at = end_time,
                  start_station_name = from_station_name,
                  start_station_id = from_station_id,
                  end_station_name = to_station_name,
                  end_station_id = to_station_id,
                  member_casual = usertype)

str(data_2019)  
str(data_2020)

data_2019 <- mutate(data_2019, 
                  ride_id = as.character(ride_id), 
                  rideable_type = as.character(rideable_type))
#combine the data sets
all_trips <- bind_rows(data_2019, data_2020)

all_trips <- all_trips %>%    
  select(-c(start_lat, start_lng, end_lat, end_lng, birthyear, gender, "tripduration"))

str(all_trips)
View (all_trips)

colnames(all_trips)  # List of column names
nrow(all_trips)      # Count the number of rows
dim(all_trips)       # Dimensions of the dataset (rows and columns)
head(all_trips)      # View the first 6 rows
str(all_trips)       # Check column data types
summary(all_trips)   # Statistical summary of numeric columns

# Reassign inconsistent values
all_trips <- all_trips %>%
  mutate(member_casual = recode(member_casual,
                                "Subscriber" = "member",
                                "Customer" = "casual"))

# Verify changes
table(all_trips$member_casual)

all_trips$date <- as.Date(all_trips$started_at)  # Extract date
all_trips$month <- format(as.Date(all_trips$date), "%m")  # Extract month
all_trips$day <- format(as.Date(all_trips$date), "%d")    # Extract day
all_trips$year <- format(as.Date(all_trips$date), "%Y")   # Extract year
all_trips$day_of_week <- format(as.Date(all_trips$date), "%A")  # Day name

all_trips$ride_length <- difftime(all_trips$ended_at, all_trips$started_at)
all_trips$ride_length <- as.numeric(as.character(all_trips$ride_length))

#Filter out rows with invalid or irrelevant data:
# Rides with start_station_name as "HQ QR" (used for quality checks).
#Rides with negative ride_length
all_trips_v2 <- all_trips[!(all_trips$start_station_name == "HQ QR" | 
                              all_trips$ride_length < 0), ]

summary(all_trips_v2)  # Statistical summary
str(all_trips_v2)      # Structure of the dataset
nrow(all_trips_v2)     # Number of rows after cleaning


