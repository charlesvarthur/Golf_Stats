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

st.selectbox('Select a course to for hole specific averages:',[''])