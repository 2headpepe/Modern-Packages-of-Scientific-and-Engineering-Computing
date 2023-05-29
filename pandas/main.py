import pandas as pd
import numpy as np
import seaborn as sns
import matplotlib.pyplot as plt
import plotly.graph_objects as go
import plotly.express as px

data = pd.read_csv("titanic.csv")
#data.fillna(data.mean())
print(data.columns, data["Sex"].head())
print(data)
print("SurvivedAAA\n", data[data["Survived"] == 1].groupby('Sex'))

pivot_table = pd.crosstab(index=data['Sex'],
                          columns=data['Survived'],
                          colnames=['Survived'],
                          rownames=['Sex'])
print(pivot_table)

data['Pclass'] = data['Pclass'].replace({1: 'VIP', 2: 'Middle', 3: 'Working'})
table = pd.crosstab(data['Survived'], data['Pclass'])
print(table)
sns.pairplot(data, hue='Survived')
plt.title('Pairplot of Dead Passengers')
plt.show()

print(table)

# Create a new column based on the values in the "Fare" column
data['Price_Category'] = data['Fare'].apply(lambda fare: 'cheap'
                                            if fare < 25 else 'expensive')

# Print the updated DataFrame
print(data.columns)

alive_data = data[data['Survived'] == 1]
dead_data = data[data['Survived'] == 0]

# alive_hist = go.Histogram(x=alive_data['Age'], nbinsx=int((alive_data['Age'].max() - alive_data['Age'].min()) / 3), name='Alive')

# dead_hist = go.Histogram(x=dead_data['Age'], nbinsx=int((dead_data['Age'].max() - dead_data['Age'].min()) / 3), name='Dead')

# layout = go.Layout(title='Age Distribution of Survivors', xaxis=dict(title='Age'), yaxis=dict(title='Count'))

# fig = go.Figure(data=[alive_hist, dead_hist], layout=layout)

# fig.show()

# Filter the data based on 'Price_Category' and 'Survived' columns
filtered_data = data[(data['Price_Category'].isin(['cheap', 'expensive']))
                     & (data['Survived'].isin([0, 1]))]

# Count the occurrences of each category
counts = filtered_data.groupby(['Price_Category',
                                'Survived']).size().reset_index(name='count')

# Create a pie chart using Plotly
fig = px.pie(counts,
             values='count',
             names='Price_Category',
             title='Survival by Price Category')
fig.show()

# Filter the data for dead and alive individuals
dead_data = data[data['Survived'] == 0]
alive_data = data[data['Survived'] == 1]

# Count the number of dead and alive men and women
dead_counts = dead_data['Sex'].value_counts()
alive_counts = alive_data['Sex'].value_counts()

# Create pie chart for dead individuals
dead_fig = go.Figure(
  data=[go.Pie(labels=dead_counts.index, values=dead_counts.values)])
dead_fig.update_layout(title='Dead Individuals by Gender')

# Create pie chart for alive individuals
alive_fig = go.Figure(
  data=[go.Pie(labels=alive_counts.index, values=alive_counts.values)])
alive_fig.update_layout(title='Alive Individuals by Gender')

# Display the pie charts
dead_fig.show()
alive_fig.show()

# Show the chart
fig.show()
