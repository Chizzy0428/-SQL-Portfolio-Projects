#!/usr/bin/env python
# coding: utf-8

# In[1]:


import pandas as pd
import matplotlib.pyplot as plt
import seaborn as sns


# In[2]:


df = pd.read_csv('C:\\Users\\HP\\Documents\\csv files\\Netflix Userbase.csv')
df.head()


# In[3]:


df.info()


# In[4]:


df.describe()


# In[5]:


df.columns


# In[6]:


df['Subscription Type'].unique()


# In[7]:


df = df.drop_duplicates()


# In[8]:


df = df.drop(['Last Payment Date','Join Date','Monthly Revenue'], axis = 1)


# In[9]:


df


# In[10]:


df.to_excel('C:\\Users\\HP\\Documents\\Portfolio Project\\My Excel Projects\\netflix.xlsx', index=False)


# In[ ]:




