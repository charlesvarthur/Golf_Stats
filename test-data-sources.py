
# Testing the population of data into round table

import pandas as pd
import altair as alt
import matplotlib.pyplot as plt

gs = pd.read_csv("full_stats.csv")
print(gs.tail())

print(max(gs['round_id']))