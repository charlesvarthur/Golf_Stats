#############################
# Golf Stats Pandas Queries #
#############################

import pandas as pd

#Data Source
golf_stats = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/full_stats.csv")

#Tests
print(golf_stats.head(10))
