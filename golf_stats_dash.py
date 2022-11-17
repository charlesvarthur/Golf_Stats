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
st.dataframe(golf_stats)

#Sidebar
st.sidebar.header("Data Filters")

#Course filters
course = st.sidebar.multiselect(
"Select the Course:",
options=golf_stats["course_name"].unique(),
default=golf_stats["course_name"].unique()
)

#print(golf_stats)