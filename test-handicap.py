import pandas as pd
import matplotlib.pyplot as plt
import altair as alt
import glob
import datetime
from datetime import date

#######################
# Handicap calculator #
#######################

def calculate_handicap_index(scores, course_ratings, slope_ratings):
    differentials = []

    # Step 1: Calculate differentials
    for score, rating, slope in zip(scores, course_ratings, slope_ratings):
        diff = (score - rating) * 113 / slope
        differentials.append(diff)

    # Step 2: Sort and take lowest 8 (if 20 rounds available)
    differentials.sort()
    lowest_diffs = differentials[:8]

    # Step 3: Average and apply multiplier
    handicap_index = sum(lowest_diffs) / len(lowest_diffs)
    handicap_index *= 0.96

    return round(handicap_index, 1)


# Recent form with stableford calculations
recent_form = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/recent_form.csv")

scores = (
    recent_form
    .groupby("round_id")["score"]
    .sum()
    .sort_index()
    .tolist()
)

print(scores)

course_ratings = (
    recent_form
    .groupby("round_id")["course_rating"]
    .sum()
    .sort_index()
    .tolist()
)

print(course_ratings)

slope_ratings = (
    recent_form
    .groupby("round_id")["slope_rating"]
    .sum()
    .sort_index()
    .tolist()
)

print(recent_form)


handicap = calculate_handicap_index(scores, course_ratings, slope_ratings)
#print("Handicap Index:", handicap)