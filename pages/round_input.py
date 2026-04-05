import streamlit as st
import pandas as pd

st.set_page_config(page_title="Golf Round Input", page_icon="⛳", layout="wide")

# Navigation row
nav1, nav2 = st.columns([1, 4])
with nav1:
    if st.button("← Back to Main"):
        st.switch_page("golf_stats_dash.py")

st.title("⛳ Golf Round Data Input")
st.caption("Enter shots and putts for each hole in a round.")

# Initialize session state
if "round_data" not in st.session_state:
    st.session_state.round_data = pd.DataFrame(
        {
            "Hole": list(range(1, 19)),
            "Par": [4] * 18,
            "Shots": [0] * 18,
            "Putts": [0] * 18,
        }
    )

if "course_name" not in st.session_state:
    st.session_state.course_name = ""

if "player_name" not in st.session_state:
    st.session_state.player_name = ""

with st.sidebar:
    st.header("Round Details")
    st.session_state.player_name = st.text_input("Player name", value=st.session_state.player_name)
    st.session_state.course_name = st.text_input("Course name", value=st.session_state.course_name)
    round_date = st.date_input("Round date")

    st.divider()
    st.subheader("Quick Actions")

    if st.button("Reset Round"):
        st.session_state.round_data = pd.DataFrame(
            {
                "Hole": list(range(1, 19)),
                "Par": [4] * 18,
                "Shots": [0] * 18,
                "Putts": [0] * 18,
            }
        )
        st.rerun()

    st.divider()
    if st.button("Back to Main"):
        st.switch_page("main.py")

st.subheader("Hole-by-hole entry")
st.write("Update par, total shots, and putts for each hole.")

edited_df = st.data_editor(
    st.session_state.round_data,
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

st.session_state.round_data = edited_df.copy()

df = st.session_state.round_data.copy()
df["Strokes Gained vs Par"] = df["Shots"] - df["Par"]
df["Non-putt Shots"] = df["Shots"] - df["Putts"]

invalid_rows = df[df["Putts"] > df["Shots"]]
if not invalid_rows.empty:
    st.error("Some holes have more putts than total shots. Please correct those entries.")

total_par = int(df["Par"].sum())
total_shots = int(df["Shots"].sum())
total_putts = int(df["Putts"].sum())
total_non_putt = int(df["Non-putt Shots"].sum())
score_to_par = total_shots - total_par

col1, col2, col3, col4 = st.columns(4)
col1.metric("Total Par", total_par)
col2.metric("Total Shots", total_shots, delta=score_to_par)
col3.metric("Total Putts", total_putts)
col4.metric("Non-putt Shots", total_non_putt)

front_nine = df[df["Hole"] <= 9]
back_nine = df[df["Hole"] >= 10]

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
st.dataframe(df, use_container_width=True, hide_index=True)

csv_data = df.to_csv(index=False).encode("utf-8")

st.download_button(
    label="Download round as CSV",
    data=csv_data,
    file_name="golf_round_data.csv",
    mime="text/csv",
)

st.info(
    f"Player: {st.session_state.player_name or 'Not set'} | "
    f"Course: {st.session_state.course_name or 'Not set'} | "
    f"Date: {round_date}"
)