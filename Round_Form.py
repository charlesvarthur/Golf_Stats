#------------------#
# Round entry form #
#------------------#

import pandas as pd
import streamlit as st
from datetime import date

class Round:
    def __init__(self,course,par,strokes,stableford,date):
        self.course = course
        self.par = par
        self.strokes = strokes
        self.stableford = stableford
        self.date = date
        self.total_data = []
        self.round_id = 1

    def enter_round(self):
        self.total_data.append(self.course,self.par,self.strokes,self.stableford,self.date)
        self.round_id += 1
        print(self.total_data)

round_1 = Round('Hurtmore Golf Club',72,104,30,'18-07-2024')
Round.enter_round(round_1)