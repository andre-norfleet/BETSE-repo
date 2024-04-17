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

data = 'BETSEnormcorrmatrix4_012824.csv'

df = pd.read_csv(data, index_col=0) #*******
df.head() #returns first 'n' rows
#df2 = df.iloc[1:,1:]# takes numerical values from matrix

#testing2 = pd.DataFrame(testing.values,index=testing.index,columns=testing.columns).round(3) #*****
#testing22 = pd.DataFrame(df.values[:,1:],index=['Ctrl', 'GJ25%', 'GJ75%', 'K10', 'K20'],columns=df.values)
testing222 = pd.DataFrame(df.values[:,:],index=df.index,columns=df.columns)
#columnsverify = ['Ctrl', 'GJ25%', 'GJ75%', 'K10', 'K20']

testing33 = df.values[:,:] - 1
testing333 = df.values[:,1]

#def NormalizeData(data):
#    return (data - np.min(data)) / (np.max(data) - np.min(data))

sklearn.preprocessing.minmax_scale(testing333, feature_range=(0, 1), axis=0, copy=True)
min_max_scaler = preprocessing.MinMaxScaler()
testing3344 = minmax_scale(testing333, feature_range=(0, 1))
testing33444 = min_max_scaler.fit_transform(df.values[:,:])

testing222norm = pd.DataFrame(testing33444,index=df.index,columns=df.columns)

colvec1 = df.values[:,0]
colvec2 = df.values[:,1]
colvec3 = df.values[:,2]
colvec4 = df.values[:,3]
colvec5 = df.values[:,4]
#colvec6 = df.values[:,5]

colvec1trnsfrm = minmax_scale(df.values[:,0], feature_range=(0, 1))
colvec2trnsfrm = minmax_scale(df.values[:,1], feature_range=(0, 1))
colvec3trnsfrm = minmax_scale(df.values[:,2], feature_range=(0, 1))
colvec4trnsfrm = minmax_scale(df.values[:,3], feature_range=(0, 1))
colvec5trnsfrm = minmax_scale(df.values[:,4], feature_range=(0, 1))
#colvec6trnsfrm = minmax_scale(df.values[:,5], feature_range=(0, 1)) 

together = np.stack((colvec1trnsfrm,colvec2trnsfrm,colvec3trnsfrm,colvec4trnsfrm,colvec5trnsfrm))
print(together)
togethernorm = pd.DataFrame(together,index=df.index,columns=df.columns)

ctrlttest1 = stats.shapiro(colvec1trnsfrm)
ctrlttest2 = stats.shapiro(colvec1)

print(ctrlttest1)
print(ctrlttest2)

#print(df.values[:,:])
#print(df.values[:,:])
#print(testing33444)
#print(df.values[:,:])

#print(together)
#print(testing222norm)
#print(togethernorm)

#mask = np.zeros_like(testing, dtype=np.bool)
#mask[np.triu_indices_from(mask)] = True


fig, ax = plt.subplots(figsize=(12,8))


#heatmap = sns.heatmap(testing222norm, vmin=0, vmax=1, annot=True)
heatmap = sns.heatmap(togethernorm, vmin=0, vmax=1, annot=True, cmap="coolwarm")

ax.add_patch(plt.Rectangle((0,0), 1, 1, fill=False,
edgecolor="yellow", lw=3))
ax.add_patch(plt.Rectangle((1,1), 1, 1, fill=False,
edgecolor="yellow", lw=3))
ax.add_patch(plt.Rectangle((2,2), 1, 1, fill=False,
edgecolor="yellow", lw=3))
ax.add_patch(plt.Rectangle((3,3), 1, 1, fill=False,
edgecolor="yellow", lw=3))
ax.add_patch(plt.Rectangle((4,4), 1, 1, fill=False,
edgecolor="yellow", lw=3))
ax.add_patch(plt.Rectangle((5,5), 1, 1, fill=False,
edgecolor="yellow", lw=3))

border_color = "black"
cell_coords = [(1,0), (0,1), (4,1), (2,4), (1,4)]
ax.annotate('**', xy=(2,0), xytext=(1.425,0.4), xycoords='data', color='white', size=16)
ax.annotate('**', xy=(0,1), xytext=(0.425,1.4), xycoords='data', color='white', size=16)
ax.annotate('**', xy=(2,4), xytext=(1.45,4.4), xycoords='data', color='black', size=16)
ax.annotate('*', xy=(4,1), xytext=(4.45,1.4), xycoords='data', color='white', size=16)
ax.annotate('**', xy=(4,2), xytext=(4.425,2.4), xycoords='data', color='white', size=16)
ax.annotate('**', xy=(4,3), xytext=(4.425,3.4), xycoords='data', color='white', size=16)

plt.savefig("finalBETSEcorrmatrix332_012824_13.png")
plt.savefig("finalBETSEcorrmatrix332_012824_13.pdf")