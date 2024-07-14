# Golf Stats Dashboard
# 16-11-2022
# Charles Arthur

import pandas as pd
import plotly_express as px
import streamlit as st
import matplotlib.pyplot as plt
import altair as alt
import glob
import datetime
from datetime import date

#Steamlit app basic config
st.set_page_config(page_title="Full Golf Stats",    
                    page_icon=":bar_chart:",
                    layout="wide"
                    )

####################
# All Data sources #
####################

#Core Data source
golf_stats = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/full_stats.csv")

#Hundred Days stats (actually 365 or other random date select)  
hundred_stats = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/full_stats_hundred_days.csv")

#Average scores data source
strokes_vs_par_avg = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/average_strokes_vs_par.csv")
strokes_vs_par_avg=strokes_vs_par_avg[strokes_vs_par_avg.notnull().all(1)]

#Sum golf stats by round_id
round_sum = golf_stats.loc[:,['round_id','score']].groupby(['round_id']).sum()

#Average round score by distance data
average_score_by_hole_length = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/average_score_by_hole_length.csv") 

#Round comparison data
form_comparison = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/form_comparison.csv")

#Recent form with stableford calculations
recent_form = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/recent_form.csv")

###########################
# Page details and tables #
###########################

#Page Header and Introduction
st.header('Golf Stats')
st.write('Hi, I\'m Charlie - I\'m a terrible golfer, but a pretty good data analyst! '
'This page is solely dedicated to golf and keeping track of my scores, based on each round, course and individual holes.')

############
# Figure 1 #
############

#First Chart, box and whisker score for course avaerage scores_vs_par 
st.subheader('Shots Over/Under Each Hole, by Course')

#Figure 1 dataset
score_vs_par_by_course = pd.DataFrame(hundred_stats .loc[:,['course_name','hole_number','score_vs_par']])

st.write('Figure 1 shows how many shots over or under (wishful thinking) I am on each course. '
'This \"box and whisker\" diagram shows the low, high and median scores. Each box contains the bulk of results and encompasses data between the '
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

############
# Figure 2 #
############

#Figure 2 
st.subheader('Average Strokes by Par & Round')

#Figure 2 averages line graph

fig1p1 = alt.Chart(strokes_vs_par_avg).mark_line(point=False, size=3).encode(
    x='round_id:O',
    y='score_average:Q',
    color='par:N',
)
st.altair_chart(fig1p1, use_container_width=True)

############################
# Course Selector Dropdown #
############################

#Course Dropdown box variables
course_names = pd.DataFrame(golf_stats.loc[:,['course_name']].sort_values(by=['course_name'],ascending=True)).drop_duplicates().reset_index(drop=True)
course_names = course_names['course_name'].values.tolist()
course_var = st.selectbox('Select a course to provide data for, in figures 2, 3 and 4:',course_names[:],index=16)

############
# Figure 3 #
############

#Figure 3 header
st.subheader('Scores by Round Date for ' + course_var)

#Figure 3 dataset
round_dates = pd.DataFrame(golf_stats.loc[golf_stats['course_name'] == course_var, ['round_date']]).drop_duplicates().reset_index(drop=True)
round_dates = round_dates['round_date'].values.tolist()

#Fig3 & 4 datebox
datebox=st.selectbox('Select a round date for Figure 3...', round_dates[:])

#Fig 3 Blurb
st.markdown('<br>Figure 3 shows the score and par for each hole at ' + course_var +', where the date is ' + datebox + '.', unsafe_allow_html=True)

#Figure 3
round_par = pd.DataFrame(golf_stats.loc[(golf_stats['course_name'] == course_var) & (golf_stats['round_date'] == datebox), ['course_name','par','score','hole_number']])

#st.write(round_par)
fig3_par = alt.Chart(round_par).mark_bar(size=10,color='grey').encode(
    x = 'hole_number', y = 'par'
)
fig3_score = alt.Chart(round_par).mark_line(size=3,color='pink').encode(
    x = 'hole_number', y = 'score'
)
fig3_layer = alt.layer(fig3_par, fig3_score).resolve_axis(
    y = 'independent'
)
fig3.encoding.x.title='hole_number'

st.altair_chart(fig3_layer, use_container_width=True)

############
# Figure 4 #
############

#Fig4 - round comparisons line graph
round_comparison = pd.DataFrame(golf_stats.loc[golf_stats['course_name'] == course_var])
round_comparison = pd.DataFrame(round_comparison.loc[:,['course_name','round_date','score']].groupby(['course_name','round_date'], as_index=False).sum())

#Fig 4 Header
st.subheader('Course Round Comparison for '+ course_var)

#Fig4 blurb
st.write('Figure 4 tracks the scores for each round at ' + course_var + '.')
#Fig4 
fig4 = alt.Chart(round_comparison).mark_line(point=True, size=5, opacity=0.7).encode(x = 'round_date', y = 'score:Q',color=alt.value('#9dc79f')
).properties(width=alt.Step(30))
fig4.encoding.x.title='round date'
fig4.encoding.y.title='total score'
st.altair_chart(fig4, use_container_width=True)

############
# Figure 5 #
############

# Need to figure out if this is going to be useful with recent_form csv


# st.subheader('Individual Round Stats')
# round_par = pd.DataFrame(full_with_stableford.loc[(full_with_stableford['course_name'] == course_var) & (full_stats['round_date'] == datebox) & (full_stats['first_name'] == player_box), ['first_name','course_name','par','score','stableford_score','hole_number']])
# #st.write(round_par)
# fig5_par = alt.Chart(round_par).mark_bar(size=10,color='grey').encode(
#     x = 'hole_number', y = 'par'
# ).properties(width=alt.Step(30))
# fig5_score = alt.Chart(round_par).mark_line(size=3,color='pink').encode(
#     x = 'hole_number', y=alt.Y('score',title='score')
# )
# fig5_stableford = alt.Chart(round_par).mark_bar(size=5,color='orange').encode(
#     x = 'hole_number', y =alt.Y('stableford_score',title='score')
# )
# fig_5_layer = alt.layer(fig5_par, fig5_score, fig5_stableford).resolve_axis(
#     y = 'independent'
# ).configure(autosize=alt.AutoSizeParams(resize=True))
# st.altair_chart(fig_5_layer, use_container_width=True)
