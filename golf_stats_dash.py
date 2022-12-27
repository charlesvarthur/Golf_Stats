# Golf Stats Dashboard
# 16-11-2022
# Charles Arthur

import pandas as pd
import plotly_express as px
import streamlit as st
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import altair as alt

#Steamlit app basic config
st.set_page_config(page_title="Full Golf Stats",
                    page_icon=":bar_chart:",
                    layout="wide"
                    )

#Data source
golf_stats = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/full_stats.csv")

# Create custom chart theme for all altair charts in this document. 
def dark_theme():
    return {
        'config':{
            'view':{
                'height':300,
                'width':700,
            },
            'mark':{
                'color':'white',
                #'fill':'grey'
            }
        }
    }

alt.themes.register('dark_theme',dark_theme)
alt.themes.enable('dark_theme')

st.header('Golf Stats')
st.write('This page is solely dedicated to golf and keeping track of my scores, based on each round, course and individual holes.')

st.subheader('Average Score vs Par Per Hole, By Course')
score_vs_par_by_course = pd.DataFrame(golf_stats.loc[:,['course_name','score_vs_par']].groupby(['course_name']).mean('score_vs_par'))
score_vs_par_by_course = score_vs_par_by_course['score_vs_par'].round(decimals=2)
st.bar_chart(score_vs_par_by_course)

# st.subheader('Plotly Charts')
# fig = px.histogram(score_vs_par_by_course)
# st.plotly_chart(fig)

#commented out sns chart - preferred altair
# sns.set_theme(style = 'darkgrid', palette='deep')
# sns.axes_style("darkgrid")
# fig, ax = plt.subplots()
# ax = sns.barplot(data = avg_hole_score_tb, x = avg_hole_score_tb.index, y = avg_hole_score_tb['score'])
# plt.title('Average hole score by course')
# plt.xlabel('Hole Number')
# plt.ylabel('Average Score Per hole')
# st.pyplot(fig)  

#Second chart and selection box for the courses
course_var = st.selectbox('Select a course to for hole specific averages:',['Alton Golf Club','Ampfield Golf Club','Boundary Lakes','Etchinghill Golf Trust','Godstone Golf Club','Hurtmore Golf Club','Paultons Golf Centre','Southampton Municapal Golf Course','The Oaks'])

if course_var in ['Alton Golf Club','Ampfield Golf Club','Boundary Lakes','Etchinghill Golf Trust','Godstone Golf Club','Hurtmore Golf Club','Paultons Golf Centre','Southampton Municapal Golf Course','The Oaks']:
    avg_hole_score_tb = pd.DataFrame(golf_stats.loc[golf_stats['course_name'] == course_var])
    avg_hole_score_tb = pd.DataFrame(avg_hole_score_tb.loc[:,['course_name','hole_number','score','par']].groupby(['course_name','hole_number','par'], as_index=False).mean())
else:
    pass

st.subheader('Average Hole Score for '+ course_var)
fig2 = alt.Chart(avg_hole_score_tb).mark_bar(size=20, opacity=0.7).encode(x = 'score:Q', y = 'hole_number:O',
).properties(height=alt.Step(30))
fig2.encoding.y.title='hole number'
st.altair_chart(fig2, use_container_width=True)

#Third chart - round comparisons
round_comparison = pd.DataFrame(golf_stats.loc[golf_stats['course_name'] == course_var])
round_comparison = pd.DataFrame(round_comparison.loc[:,['course_name','round_date','score']].groupby(['course_name','round_date'], as_index=False).sum())

st.subheader('Course Round Comparison for '+ course_var)
fig3 = alt.Chart(round_comparison).mark_line(point=True, size=5, opacity=0.7).encode(x = 'round_date', y = 'score:Q',
).properties(width=alt.Step(30))
fig3.encoding.x.title='round_date'
fig3.encoding.y.title='total score'
st.altair_chart(fig3, use_container_width=True)

#Score & par
round_dates = pd.DataFrame(golf_stats[golf_stats['course_name'] == course_var, ['round_date']])
st.write(round_dates)
# round_dates = pd.DataFrame(round_dates).reset_index(drop=True)
# round_dates = round_dates['round_date'].values.tolist()

# datebox=st.selectbox('Which date would you like scores from?', round_dates[:])

# round_hole_scores = pd.DataFrame(golf_stats.loc[golf_stats['course_name'] == course_var & golf_stats['round_date'] == datebox])
# st.subheader('Scores by Round Date for ' + course_var)

# fig4 = alt.Chart(round_hole_scores).mark_bar(size=20).encode(x = 'hole_number', y = 'score',
# ).properties(width=alt.Step(30))
# fig4.encoding.x.title='hole number'
# st.altair_chart(fig4, use_container_width=True)