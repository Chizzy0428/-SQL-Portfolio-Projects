#!/usr/bin/env python
# coding: utf-8

# In[1]:


import numpy as np
import pandas as pd
import matplotlib
import matplotlib.pyplot as plt
import seaborn as sns


# In[2]:


df = pd.read_csv('C:\\Users\\HP\\Documents\\Portfolio Project\\womens-world-cup.csv')


# In[20]:


df.info();


# In[21]:


df.head()


# In[22]:


df.drop_duplicates()


# In[23]:


df.dropna()


# In[24]:


df.columns


# In[25]:


df_years = df.groupby('year').agg({'goals': 'sum','assists' : 'sum'})
df_years


# In[26]:


df_years.index


# In[27]:


plt.plot(df_years.index, df_years.goals, marker='o')
plt.title('Fifa womens World Cup Goal Trend')
plt.xlabel('Year')
plt.ylabel('Goals');


# In[28]:


plt.plot(df_years.index, df_years.assists, marker='x')
plt.title('Fifa womens World Cup Assists Trend')
plt.xlabel('Year')
plt.ylabel('Assists');


# In[29]:


df_2019 = df[df['year'] == 2019]


# In[30]:


df_2019.head()


# In[31]:


df_2019 = df_2019.drop(columns=['matches_played','starts', 'min_playing_time', 'minutes_played_90s', 'non_penalty_goals', 'penalty_kicks_made', 'penalty_kicks_attempted','goals_per_90', 'assists_per_90',
       'goals_plus_assists_per_90', 'goals_minus_penalty_kicks_per_90','goals_plus_assists_minus_penalty_kicks_per_90'])


# In[32]:


df_2019.columns


# In[33]:


sns.set_style("darkgrid")
matplotlib.rcParams['font.size'] = 14
matplotlib.rcParams['figure.figsize'] = (9, 5)



# In[38]:


plt.title('FIFA Womens World Cup 2019 Highest Scoring Teams')
sns.barplot(x='goals', y ='squad', data=df_2019);


# In[37]:


plt.title('FIFA Womens World Cup 2019 Teams With the Highest Assists ')
sns.barplot(x='assists', y ='squad', data=df_2019);


# In[36]:


df_2019.to_csv('C:\\Users\\HP\\Documents\\csv files\\fifa womens worldcup 2019.csv', index=False)


# In[ ]:





# In[ ]:




