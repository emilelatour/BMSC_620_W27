library(lubridate)

# Set term start date
term_start <- ymd("2026-09-28")

# Class meeting dates (e.g., Mondays and Wednesdays)
w1d1 <- term_start
w1d2 <- term_start + days(2)

w2d1 <- term_start + weeks(1)
w2d2 <- term_start + weeks(1) + days(2)

w3d1 <- term_start + weeks(2)
w3d2 <- term_start + weeks(2) + days(2)

# Homework due dates
hw0 <- term_start + days(5)
hw1 <- term_start + weeks(1) + days(5)
hw2 <- term_start + weeks(2) + days(5)