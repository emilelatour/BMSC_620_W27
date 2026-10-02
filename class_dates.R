# Course calendar: the single source of truth for every date on the site.
# schedule.qmd, homework.qmd, and exams.qmd all read from this file.
# Variables that are NA show up as "TBA" on the site.

library(lubridate)

# ---- Term settings (confirm before the term starts) --------------------------

term_start <- ymd("2027-01-04")  # Monday of week 1 (TBD: confirm)
n_weeks    <- 11

# Homework is due this many days after the Monday of its week
# (5 = Saturday, 6 = Sunday). The homework page reads the weekday from here.
hw_due_offset <- days(5)

# ---- Class meetings ----------------------------------------------------------
# Creates w1d1, w1d2, ..., w11d2 (d1 = Monday, d2 = Wednesday)

for (w in seq_len(n_weeks)) {
  monday <- term_start + weeks(w - 1)
  assign(paste0("w", w, "d1"), monday)
  assign(paste0("w", w, "d2"), monday + days(2))
}

# No-class days
mlk_day       <- ymd("2027-01-18")
presidents_day <- ymd("2027-02-15")

# ---- Homework due dates ------------------------------------------------------
# Default: HW n is due at the end of week n + 1. Creates hw0, ..., hw8.
# Override individual assignments below once the schedule is set.

for (h in 0:8) {
  assign(paste0("hw", h), term_start + weeks(h) + hw_due_offset)
}

# hw5 <- ymd("2027-02-20")  # example override

# ---- Exams (TBA until set) ---------------------------------------------------

midterm_open <- as.Date(NA)
midterm_due  <- as.Date(NA)
final_open   <- as.Date(NA)
final_due    <- as.Date(NA)

# ---- Helper ------------------------------------------------------------------
# Format a date for display, or "TBA" if it hasn't been set yet.

fmt_date <- function(x, fmt = "%a, %m/%d") {
  if (length(x) == 0 || is.na(x)) return("TBA")
  format(x, fmt)
}
