import pyreadstat
import pandas as pd
import numpy as np
from sklearn.linear_model import LinearRegression
import matplotlib.pyplot as plt


dtafile = 'brazil_stata12_Viola_Venceslau.dta'
df, meta = pyreadstat.read_dta(dtafile)

df.head()

X = df.iloc[:, 0].values.reshape(-1, 1)  # values converts it into a numpy array
Y = df.iloc[:, 1].values.reshape(-1, 1)  # -1 means that calculate the dimension of rows, but have 1 column

model = LinearRegression()
model.fit(X,Y)

r_sq = model.score(X,Y)
print('coefficient of determination:', r_sq)
print('intercept:', model.intercept_)
print('slope:', model.coef_)

Y_pred = model.predict(X)  # make predictions
plt.scatter(X, Y)
plt.plot(X, Y_pred, color='red')
plt.show()