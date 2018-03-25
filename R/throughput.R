# this file was written by Brian Rogers

library(tidyverse)
library(dplyr)

# read data files
data_full <- read_csv("data/data.csv")

View(data_full)

# break table into large/medium and small/tiny
large_medium <- filter(data_full, file_size_name != "small", file_size_name != "tiny")
small_tiny <- filter(data_full, file_size_name != "large", file_size_name != "medium")

#### THROUGHPUT ####
# graph violin plot
ggplot(data = data_full, mapping = aes(x = trial_name, y = throughput_bytes_per_second)) + geom_violin() + facet_wrap(~ file_size_name)

# graph line graph
ggplot(data = data_full, mapping = aes(x = trial_num, y = throughput_bytes_per_second, color = trial_name)) + geom_jitter() + facet_wrap(~ file_size_name)

#### REAL_TIME_SECONDS ####

# large_medium
ggplot(data = large_medium, mapping = aes(x = trial_num, y = real_time_seconds, color = trial_name)) + geom_jitter() + facet_wrap(~ file_size_name)
ggplot(data = small_tiny, mapping = aes(x = trial_num, y = real_time_seconds, color = trial_name)) + geom_jitter() + facet_wrap(~ file_size_name)
mean(data_full$real_time_seconds)
