#############################
# Golf Stats Pandas Queries #
#############################

import pandas as pd

#Data Source
golf_stats = pd.read_csv('https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/full_stats.csv')

#Tests
print(golf_stats)

score_vs_par_by_round = pd.DataFrame(golf_stats.loc[:,['course_name','score_vs_par']].groupby(['course_name']).mean('score_vs_par'))
score_vs_par_by_round = score_vs_par_by_round['score_vs_par'].round(decimals=2)
print(score_vs_par_by_round)