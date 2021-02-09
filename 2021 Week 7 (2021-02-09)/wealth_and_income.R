# Author: Abiola P. AYODELE (@AbiolaPAyodele)
# Date: 9th February, 2021
# Project: #TidyTuesday
# Week: 7

# Load the required package(s)
library(tidyverse)
library(tidytuesdayR)
# Load the data

# Read in with tidytuesdayR package
# Install from CRAN via: install.packages("tidytuesdayR")
# This loads the readme and all the datasets for the week of interest

# Either ISO-8601 date or year/week works!

tuesdata <- tidytuesdayR::tt_load("2021-02-09")
# tuesdata <- tidytuesdayR::tt_load(2021, week = 7)

student_debt <- tuesdata$student_debt #student debt data

#check data summary
summary(student_debt)

#check for missing data
sum(is.na(student_debt))

#check data structure
str(student_debt)

#change race to factor
student_debt$race <- as.factor(student_debt$race)
str(student_debt)

#create a plot of average family student loan by race and year
avg_student_debt_plot <- ggplot(student_debt, aes(year, loan_debt)) +
      geom_line(aes(colour = race)) +
      labs(
            title = "Average family student debt",
            subtitle = "In 2016, blacks have the highest average student debt per family",
            caption = "Data from Urban Institue & US Census
            Visualisatioin by: @AbiolaPAyodele",
            x = "Year",
            y = "Average family loan debt"
      ) +
      scale_y_continuous(breaks = seq(0, 15000, by = 2000)) +
      scale_x_continuous(breaks = seq(1989, 2016, by = 3))

#view the plot of average family student loan by race and year
avg_student_debt_plot

#save plot
ggsave("Avg_student_debt_plot.jpeg", avg_student_debt_plot)

#create a plot of average family student loan by race

avg_student_debt_by_race_plot <- ggplot(student_debt, aes(race, loan_debt)) +
      geom_boxplot(aes(fill = race)) +
      labs(
            title = "Average family student debt",
            subtitle = "On average, white families have higher student debt",
            caption = "Data from Urban Institue & US Census
            Visualisation by: @AbiolaPAyodele",
            x = "Race",
            y = "Average student loan debt"
      ) +
      scale_y_continuous(breaks = seq(0, 15000, by = 2000))

#view the plot of average family student loan by race
avg_student_debt_by_race_plot

#save plot
ggsave("Avg_student_debt_by_race_plot.jpeg", avg_student_debt_by_race_plot)

