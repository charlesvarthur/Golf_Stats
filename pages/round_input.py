import pandas as pd
import streamlit as st
import matplotlib.pyplot as plt
import altair as alt
import glob
import datetime
from datetime import date

#--------------------
# Load data
#--------------------

st.set_page_config(page_title="Golf Round Input", page_icon="⛳", layout="wide")

# Navigation row
nav1, nav2 = st.columns([1, 4])
with nav1:
    if st.button("← Back to Main"):
        st.switch_page("golf_stats_dash.py")    

st.title("⛳ New Round Input")
st.caption("Enter shots and putts for each hole in a round.")

@st.cache_data
def load_course_data():
    stats_df = pd.read_csv("full_stats.csv")
    stats_df["course_name"] = stats_df["course_name"].astype(str)
    return stats_df

def build_round_template(course_name, existing_df=None):
    course_df = load_course_data()
    par_lookup = (
        course_df.loc[course_df["course_name"] == course_name, ["hole_number", "par"]]
        .dropna(subset=["hole_number", "par"])
        .drop_duplicates(subset=["hole_number"])
        .sort_values("hole_number")
    )

    hole_numbers = par_lookup["hole_number"].astype(int).tolist()
    if not hole_numbers:
        hole_numbers = list(range(1, 19))

    template = pd.DataFrame({"Hole": hole_numbers})
    template["Par"] = template["Hole"].map(
        par_lookup.set_index("hole_number")["par"].to_dict()
    ).fillna(4).astype(int)
    template["Shots"] = 0
    template["Putts"] = 0

    if existing_df is not None and {"Hole", "Shots", "Putts"}.issubset(existing_df.columns):
        existing_values = existing_df.loc[:, ["Hole", "Shots", "Putts"]].copy()
        template = template.merge(existing_values, on="Hole", how="left", suffixes=("", "_existing"))
        template["Shots"] = template["Shots_existing"].fillna(template["Shots"]).astype(int)
        template["Putts"] = template["Putts_existing"].fillna(template["Putts"]).astype(int)
        template = template.drop(columns=["Shots_existing", "Putts_existing"])

    return template

def sync_round_data_to_course():
    existing_df = st.session_state.get("round_entry_data")
    st.session_state.round_entry_data = build_round_template(st.session_state.round_entry_course, existing_df)
    st.session_state.round_course_loaded = st.session_state.round_entry_course

# Initialize session state
if "round_entry_data" not in st.session_state:
    st.session_state.round_entry_data = pd.DataFrame(
        {
            "Hole": list(range(1, 19)),
            "Par": [4] * 18,
            "Shots": [0] * 18,
            "Putts": [0] * 18,
        }
    )

if "round_entry_course" not in st.session_state:
    st.session_state.round_entry_course = ""

if "player_name" not in st.session_state:
    st.session_state.player_name = ""

course_options = sorted(load_course_data()["course_name"].dropna().unique().tolist())

default_course_index = 0
if st.session_state.round_entry_course in course_options:
    default_course_index = course_options.index(st.session_state.round_entry_course)

if "round_course_loaded" not in st.session_state:
    st.session_state.round_course_loaded = ""

if not st.session_state.round_entry_course and course_options:
    st.session_state.round_entry_course = course_options[default_course_index]

if (
    st.session_state.round_entry_course
    and st.session_state.round_course_loaded != st.session_state.round_entry_course
):
    sync_round_data_to_course()

with st.sidebar:
    st.header("Round Details")
    st.session_state.player_name = st.text_input("Player name", value=st.session_state.player_name)
    st.selectbox(
        "Select a course:",
        course_options,
        index=default_course_index,
        on_change=sync_round_data_to_course,
        key="round_entry_course",
    )
 
    round_date = st.date_input("Round date")

    st.divider()
    st.subheader("Quick Actions")

    if st.button("Reset Round"):
        st.session_state.round_entry_data = build_round_template(st.session_state.round_entry_course)
        st.session_state.round_course_loaded = st.session_state.round_entry_course
        st.rerun()

    st.divider()
    if st.button("Back to Main"):
        st.switch_page("main.py")

st.subheader("Hole-by-hole entry")
st.write("Update par, total shots, and putts for each hole.")

with st.form("round_entry_form"):
    edited_df = st.data_editor(
        st.session_state.round_entry_data,
        use_container_width=True,
        hide_index=True,
        column_config={
            "Hole": st.column_config.NumberColumn("Hole", disabled=True),
            "Par": st.column_config.NumberColumn("Par", min_value=3, max_value=6, step=1),
            "Shots": st.column_config.NumberColumn("Shots", min_value=0, max_value=20, step=1),
            "Putts": st.column_config.NumberColumn("Putts", min_value=0, max_value=10, step=1),
        },
        key="round_editor",
    )
    apply_edits = st.form_submit_button("Apply hole updates")

if apply_edits:
    st.session_state.round_entry_data = edited_df.copy()

new_df = st.session_state.round_entry_data.copy()
new_df ["Round ID"] = max(edited_df['round_id']) + 1
new_df["Strokes Gained vs Par"] = new_df["Shots"] - new_df["Par"]
new_df["Non-putt Shots"] = new_df["Shots"] - new_df["Putts"]

invalid_rows = new_df[new_df["Putts"] > new_df["Shots"]]
if not invalid_rows.empty:
    st.error("Some holes have more putts than total shots. Please correct those entries.")

total_par = int(new_df["Par"].sum())
total_shots = int(new_df["Shots"].sum())
total_putts = int(new_df["Putts"].sum())
total_non_putt = int(new_df["Non-putt Shots"].sum())
score_to_par = total_shots - total_par

col1, col2, col3, col4 = st.columns(4)
col1.metric("Total Par", total_par)
col2.metric("Total Shots", total_shots, delta=score_to_par)
col3.metric("Total Putts", total_putts)
col4.metric("Non-putt Shots", total_non_putt)

front_nine = new_df[new_df["Hole"] <= 9]
back_nine = new_df[new_df["Hole"] >= 10]

st.subheader("Round breakdown")
left, right = st.columns(2)

with left:
    st.markdown("**Front 9**")
    st.write(
        {
            "Par": int(front_nine["Par"].sum()),
            "Shots": int(front_nine["Shots"].sum()),
            "Putts": int(front_nine["Putts"].sum()),
        }
    )

with right:
    st.markdown("**Back 9**")
    st.write(
        {
            "Par": int(back_nine["Par"].sum()),
            "Shots": int(back_nine["Shots"].sum()),
            "Putts": int(back_nine["Putts"].sum()),
        }
    )

st.subheader("Entered data preview")
st.dataframe(new_df, use_container_width=True, hide_index=True)

csv_data = new_df.to_csv(index=False).encode("utf-8")

st.download_button(
    label="Download round as CSV",
    data=csv_data,
    file_name="golf_round_data.csv",
    mime="text/csv",
)

st.info(
    f"Player: {st.session_state.player_name or 'Not set'} | "
    f"Course: {st.session_state.round_entry_course or 'Not set'} | "
    f"Date: {round_date}"
)
