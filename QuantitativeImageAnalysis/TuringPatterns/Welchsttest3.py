import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns
import numpy as np
import sklearn
from sklearn.preprocessing import MinMaxScaler
from sklearn.preprocessing import minmax_scale
#from sklearn.preprocessing import min_max_scaler
from sklearn import preprocessing
from scipy import stats

data = 'BETSEGJ75Decvsinvitro.csv'

df = pd.read_csv(data)

#testfind = df.values[9,:]
#Normvsctrl = df.values[1265:1354,0]
GJ75DecvsbGA10 = df.iloc[0:65,0] # check
GJ75DecvsbGA60 = df.iloc[65:150,0] # check
GJ75DecvsK10 = df.iloc[150:236,0] # check
GJ75DecvsK20 = df.iloc[236:329,0] # check
GJ75DecvsCtrl = df.iloc[329:419,0] # check
Welchtest2 = stats.ttest_ind(GJ25DecvsbGA10, GJ25DecvsCtrl, equal_var=False)

#print(testfind)
print(Welchtest2)