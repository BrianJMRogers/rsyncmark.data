# this file was written by Brian Rogers

library(tidyverse)
library(dplyr)

read_data <- function()
{
  # read data files
  data_full <- read_csv("inst/data.csv")
  return(data_full)
}

violin_plot_throughput <- function()
{
  data_full <- read_data()
  # graph line graph
  ggplot(data = data_full, mapping = aes(x = trial_name, y = throughput_bytes_per_second)) + geom_violin() + facet_wrap(~ file_size_name)
}

point_plot_throughput <- function()
{
  data_full <- read_data()
  # graph line graph
  ggplot(data = data_full, mapping = aes(x = trial_num, y = throughput_bytes_per_second, color = trial_name)) + geom_jitter() + facet_wrap(~ file_size_name)
}



graph_large_medium_real_time <- function()
{
  data_full <- read_data()
  large_medium <- filter(data_full, file_size_name != "small", file_size_name != "tiny")
  ggplot(data = large_medium, mapping = aes(x = trial_num, y = real_time_seconds, color = trial_name)) + geom_jitter() + facet_wrap(~ file_size_name)
}

graph_small_tiny_real_time <- function()
{
  data_full <- read_data()
  small_tiny <- filter(data_full, file_size_name != "large", file_size_name != "medium")
  ggplot(data = small_tiny, mapping = aes(x = trial_num, y = real_time_seconds, color = trial_name)) + geom_jitter() + facet_wrap(~ file_size_name)
}
