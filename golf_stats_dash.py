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

st.header('Golf Stats')
st.write('This page is solely dedicated to golf and keeping track of my scores, based on each round, course and individual holes.')

st.subheader('Average Score vs Par Per Hole, By Course')
score_vs_par_by_course = pd.DataFrame(golf_stats.loc[:,['course_name','score_vs_par']].groupby(['course_name']).mean('score_vs_par'))
score_vs_par_by_course = score_vs_par_by_course['score_vs_par'].round(decimals=2)
st.bar_chart(score_vs_par_by_course)

# st.subheader('Plotly Charts')
# fig = px.histogram(score_vs_par_by_course)
# st.plotly_chart(fig)

course_var = st.selectbox('Select a course to for hole specific averages:',['Alton Golf Club','Ampfield Golf Club','Boundary Lakes','Etchinghill Golf Trust','Godstone Golf Club','Hurtmore Golf Club','Paultons Golf Centre','Southampton Municapal Golf Course','The Oaks'])

if course_var in ['Alton Golf Club','Ampfield Golf Club','Boundary Lakes','Etchinghill Golf Trust','Godstone Golf Club','Hurtmore Golf Club','Paultons Golf Centre','Southampton Municapal Golf Course','The Oaks']:
    avg_hole_score_tb = pd.DataFrame(golf_stats.loc[golf_stats['course_name'] == course_var])
    avg_hole_score_tb = pd.DataFrame(avg_hole_score_tb.loc[:,['course_name','hole_number','score','par']].groupby(['course_name','hole_number','par'], as_index=False).mean())
else:
    pass

#commented out sns chart - preferred altair
# sns.set_theme(style = 'darkgrid', palette='deep')
# sns.axes_style("darkgrid")
# fig, ax = plt.subplots()
# ax = sns.barplot(data = avg_hole_score_tb, x = avg_hole_score_tb.index, y = avg_hole_score_tb['score'])
# plt.title('Average hole score by course')
# plt.xlabel('Hole Number')
# plt.ylabel('Average Score Per hole')
# st.pyplot(fig)  


st.subheader('Average Hole Score for '+ course_var)
fig2 = alt.Chart(avg_hole_score_tb).mark_bar(size=20, opacity=0.7).encode(x = 'score:Q', y = 'hole_number:O',
color=alt.Color(scale=alt.Scale(scheme='dark2')
).properties(height=alt.Step(30))
fig2.encoding.y.title='hole number'
st.altair_chart(fig2, use_container_width=True)
