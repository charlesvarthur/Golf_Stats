# Golf Stats Dashboard
# 16-11-2022
# Charles Arthur

import pandas as pd
import plotly_express as pl
import openpyxl as oyxl
import streamlit as st


st.set_page_config(page_title="CA Full Golf Stats",
                    page_icon=":bar_chart:",
                    layout="wide"
                    )

golf_stats = pd.read_csv("https://raw.githubusercontent.com/charlesvarthur/Golf_Stats/main/full_stats.csv?token=GHSAT0AAAAAAB3I2DXYY3VEZQRBFMPVV2UEY3VFW4Q")
    
st.dataframe(golf_stats)

#print(golf_stats)