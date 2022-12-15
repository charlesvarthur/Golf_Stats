# Golf Stats Dashboard
# 16-11-2022
# Charles Arthur

import pandas as pd
import plotly_express as px
import openpyxl as opxl
import streamlit as st

#Steamlit app basic config
st.set_page_config(page_title="CA Full Golf Stats",
                    page_icon=":bar_chart:",
                    layout="wide"
                    )

#Data source
golf_stats = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/full_stats.csv")

#Total score by course
score_by_course = golf_stats.loc[:,['course_name','score_vs_par']].groupby(['course_name']).sum().rename(columns={"index": "course_name"})

#Sidebar
st.sidebar.header("Data Filters:")

#Filters
course_name = st.sidebar.multiselect(
    "Select the course:",
    options=score_by_course["course_name"].unique(),
    default=score_by_course["course_name"].unique()
)

score_vs_par = st.sidebar.multiselect(
    "Select the score vs the par:",
    options=score_by_course["score_vs_par"].unique(),
    default=score_by_course["score_vs_par"].unique()
)

# par = st.sidebar.multiselect(
#     "Select the par:",
#     options=golf_stats["par"].unique(),
#     default=golf_stats["par"].unique()
# )

#Filter query, referencing filter variables
golf_stats_selection = score_by_course.query(
    "course_name == @course_name & score_vs_par == @score_vs_par" #& par == @par "
)

#Dataframe to streamlit
#st.dataframe(golf_stats_selection)

st.title(":bar_chart: Golf stats")
st.markdown("##")

#Create a bar charts with the scores for each round. 
fig_score_by_course = px.bar(
    score_by_course,
    x="course_name",
    y="score_vs_par",
    orientation="v",
    title="<b>Average Score by Course</b>",
    template="plotly_dark",
)

st.plotly_chart(fig_score_by_course)