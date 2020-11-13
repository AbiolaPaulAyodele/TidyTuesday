# Author: Abiola P. AYODELE (@AbiolaPAyodele)
# Date: 12th November, 2020
# Project: #TidyTuesday
# Week: 46

# Load the required package(s)
library(tidyverse)

# Load the data

# Read in with tidytuesdayR package
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

tuesdata <- tidytuesdayR::tt_load("2020-11-10")
# tuesdata <- tidytuesdayR::tt_load(2020, week = 46)

mobile <- tuesdata$mobile # mobile subscription data
landline <- tuesdata$landline # landline subscription data

# Create a dataset of average mobile subscribers by year and continent
avg_mobile_sub <- mobile %>%
      select(year,mobile_subs, continent) %>%
      group_by(continent, year) %>%
      summarise(avg_mobile_subs = mean(mobile_subs, na.rm = TRUE))

# Create a dataset of averagre landline subscribers by year and continent
avg_landline_sub <- landline %>%
      select(year, landline_subs, continent) %>%
      group_by(continent, year) %>%
      summarise(avg_landline_subs = mean(landline_subs, na.rm = TRUE))

# Create a plot of average mobile subscribers for each continent each year
mobile_plot <- ggplot(avg_mobile_sub, aes(year, avg_mobile_subs)) +
      geom_line(aes(colour = continent)) +
      labs(
            title = "Average mobile subscription increases yearly",
            subtitle = "Asia has the most subcribers while Africa has the fewest",
            caption = "Data from OurWorldInData.org
            Visualisation by @AbiolaPAyodele",
            x = "Year",
            y = "Average mobile subscription (per 100 people)"
            
      ) +
      scale_y_continuous(breaks = seq(0, 120, by = 20)) +
      scale_x_continuous(breaks = seq(1990, 2017, by = 4))

# View the plot of average mobile subscribers for each continent each year
mobile_plot

# Create a plot of average landline subscribers for each continent each year
landline_plot <- ggplot(avg_landline_sub, aes(year, avg_landline_subs)) +
      geom_line(aes(colour = continent)) +
      labs(
            title = "Average landline subscription",
            subtitle = "Landline subscription has been experiencing a decrease",
            caption = "Data from OurWorldInData.org
            Visualisation by @AbiolaPAyodele",
            x = "Year",
            y = "Average landline subscription (per 100 people)"
            
      ) +
      scale_y_continuous(breaks = seq(0, 50, by = 5)) +
      scale_x_continuous(breaks = seq(1990, 2019, by = 4))

# View the plot of average landline subscribers for each continent eact year
landline_plot

# save plots
# ggsave("mobile_plot.jpeg", mobile_plot)
# ggsave("landline_plot.jpeg", landline_plot)
