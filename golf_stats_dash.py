# Golf Stats Dashboard
# 16-11-2022
# Charles Arthur

import pandas as pd
import plotly_express as pl
import openpyxl as oyxl
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
    default=None
)

score_vs_par = st.sidebar.multiselect(
    "Select the round date:",
    options=golf_stats["score_vs_par"].unique(),
    default=golf_stats["stroke_vs_par"].unique()
)

par = st.sidebar.multiselect(
    "Select the par:",
    options=golf_stats["par"].unique(),
    default=golf_stats["par"].unique()
)

#Filter query, referencing filter variables
gss = golf_stats.query(
    "course_name == @course_name & stroke_index == @stroke_index & par == @par "
)

#Dataframe to streamlit
st.dataframe(gss)




#Creating a dashboard
st.title(":bar_chart: Stats Dashboard")
st.markdown("##")


# Average score total score
average_par = round(golf_stats["par"].mean(),1)


# Average score by course
