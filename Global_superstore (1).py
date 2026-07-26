#!/usr/bin/env python
# coding: utf-8

# In[2]:


import pandas as pd

df = pd.read_csv(
    r"C:\Users\User\Downloads\Global Superstore.txt\Global Superstore.csv"
)


# In[3]:


# In[2]:


df.head()


# In[4]:


# In[3]:


df.info()


# In[5]:


# In[4]:

df.describe(include='all')


# In[6]:


# In[5]:

df.isnull().sum()


# In[7]:


# In[6]:

df.columns = df.columns.str.lower()
df.columns = df.columns.str.replace(' ', '_')


# In[8]:


df.columns


# In[11]:


# In[7]:

df.head()


# In[13]:


df.to_csv(
    r"C:\Users\User\Downloads\Global Superstore_cleaned.csv",
    index=False
)


# In[ ]:




