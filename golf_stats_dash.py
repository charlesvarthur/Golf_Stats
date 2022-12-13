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

#Sidebar
st.sidebar.header("Data Filters:")

#Filters
course_name = st.sidebar.multiselect(
    "Select the course:",
    options=golf_stats["course_name"].unique(),
    default=golf_stats["course_name"].unique()
)

score_vs_par = st.sidebar.multiselect(
    "Select the score vs the par:",
    options=golf_stats["score_vs_par"].unique(),
    default=golf_stats["score_vs_par"].unique()
)

par = st.sidebar.multiselect(
    "Select the par:",
    options=golf_stats["par"].unique(),
    default=golf_stats["par"].unique()
)

#Filter query, referencing filter variables
gss = golf_stats.query(
    "course_name == @course_name & score_vs_par == @score_vs_par & par == @par "
)

#Dataframe to streamlit
st.dataframe(gss)


st.title(":bar_chart: Targets Dashboard")
st.markdown("##")




#Create a bar charts with the scores for each round. 

#Average score by stroke_index