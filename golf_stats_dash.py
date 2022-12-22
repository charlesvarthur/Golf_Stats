# Golf Stats Dashboard
# 16-11-2022
# Charles Arthur

import pandas as pd
import plotly_express as px
import streamlit as st
import matplotlib.pyplot as plt
import seaborn as sns

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

sns.set_theme(style = 'darkgrid', palette='deep')
sns.axes_style("darkgrid")
fig, ax = plt.subplots()
ax = sns.barplot(data = golf_stats.loc[['course_name'] == course_var], x = golf_stats['hole_number'], y = golf_stats['score'].mean())
plt.title('Characteristics of penguins')#.format(selected_species))
plt.xlabel('Hole Number')
plt.ylabel('Average Score Per hole')
st.pyplot(fig)  