# Golf Stats Dashboard
# 16-11-2022
# Charles Arthur

import pandas as pd
import plotly_express as px
import streamlit as st
import matplotlib.pyplot as plt
import altair as alt

#Steamlit app basic config
st.set_page_config(page_title="Full Golf Stats",
                    page_icon=":bar_chart:",
                    layout="wide"
                    )

#Core Data source
golf_stats = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/full_stats.csv")

#Page Header and Introduction
st.header('Golf Stats')
st.write('Hi, I\'m Charlie - I\'m a terrible golfer, but a pretty good data analyst! '
'This page is solely dedicated to golf and keeping track of my scores, based on each round, course and individual holes.')


#First Chart, box and whisker score for course avaerage scores_vs_par 
st.subheader('Shots Over/Under Each Hole, by Course')

#Figure 1 dataset
score_vs_par_by_course = pd.DataFrame(golf_stats.loc[:,['course_name','hole_number','score_vs_par']])

st.write('Figure one, shows how many shots over or under (wishful thinking) I am on each course. '
'This \'box and whiker\' diagram shows the low, high and median scores, and each box will be the bulk of results between the '
'25th and 75th percentiles.')

#Figure 1
fig1 = alt.Chart(score_vs_par_by_course).mark_boxplot(color='grey', extent='min-max').encode(
    x=alt.X('course_name:O', axis=alt.Axis(labels=False)),
    y=alt.Y('score_vs_par:Q'),
    color=alt.Color('course_name', legend=alt.Legend(orient='bottom', direction='vertical'))
).properties(height=500)
fig1.encoding.x.title='course'
fig1.encoding.y.title='score vs par'
st.altair_chart(fig1, use_container_width=True)

#Course Dropdown box variables
course_names = pd.DataFrame(golf_stats.loc[:,['course_name']].sort_values(by=['course_name'],ascending=True)).drop_duplicates().reset_index(drop=True)
course_names = course_names['course_name'].values.tolist()
course_var = st.selectbox('Select a course to for hole specific averages:',course_names[:])



#Figure 2 dataset
avg_hole_score_tb = pd.DataFrame(golf_stats.loc[golf_stats['course_name'] == course_var])
avg_hole_score_tb = pd.DataFrame(avg_hole_score_tb.loc[:,['course_name','hole_number','score','par']].groupby(['course_name','hole_number','par'], as_index=False).mean())

#Figure 2
fig2 = alt.Chart(avg_hole_score_tb).mark_bar(color='#00CCCC').encode(
    x = 'score:Q', 
    y = 'hole_number:O',
).properties(height=alt.Step(30))
fig2.encoding.y.title='hole number'
st.altair_chart(fig2, use_container_width=True)


#Third chart - round comparisons line graph
round_comparison = pd.DataFrame(golf_stats.loc[golf_stats['course_name'] == course_var])
round_comparison = pd.DataFrame(round_comparison.loc[:,['course_name','round_date','score']].groupby(['course_name','round_date'], as_index=False).sum())

st.subheader('Course Round Comparison for '+ course_var)
fig3 = alt.Chart(round_comparison).mark_line(point=True, color='#9dc79f', size=5, opacity=0.7).encode(x = 'round_date', y = 'score:Q',
).properties(width=alt.Step(30))
fig3.encoding.x.title='round_date'
fig3.encoding.y.title='total score'
st.altair_chart(fig3, use_container_width=True)

#Figure 4 header
st.subheader('Scores by Round Date for ' + course_var)

#Figure 4 dataset
round_dates = pd.DataFrame(golf_stats.loc[golf_stats['course_name'] == course_var, ['round_date']]).drop_duplicates().reset_index(drop=True)
round_dates = round_dates['round_date'].values.tolist()

datebox=st.selectbox('Which date would you like scores from?', round_dates[:])

#Figure 4
round_par = pd.DataFrame(golf_stats.loc[(golf_stats['course_name'] == course_var) & (golf_stats['round_date'] == datebox), ['course_name','par','score','hole_number']])
#st.write(round_par)
fig4_par = alt.Chart(round_par).mark_bar(size=10,color='grey').encode(
    x = 'hole_number', y = 'par'
)
fig4_score = alt.Chart(round_par).mark_line(size=3,color='pink').encode(
    x = 'hole_number', y = 'score'
)
fig_4_layer = alt.layer(fig4_par, fig4_score).resolve_axis(
    y = 'independent'
)
st.altair_chart(fig_4_layer, use_container_width=True)