import pandas as pd
# Recent form with stableford calculations
try:
    recent_form = pd.read_csv("recent_form.csv")
except Exception:
    recent_form = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/recent_form.csv")

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

scores = (
    recent_form
    .groupby("round_id")["score"]
    .sum()
    .sort_index()
    .tolist()
)
course_ratings = (
    recent_form
    .groupby("round_id")["course_rating"]
    .first()
    .sort_index()
    .tolist()
)
slope_ratings = (
    recent_form
    .groupby("round_id")["slope_rating"]
    .first()
    .sort_index()
    .tolist()
)

handicap = calculate_handicap_index(scores, course_ratings, slope_ratings)
print("Handicap Index:", handicap)
