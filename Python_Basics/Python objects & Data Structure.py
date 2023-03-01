# <center><u>1. Numbers on Python</u></center>
# 
# There are 2 types - Interger and Float

# In[2]:


print("----------Mathematical Operations----------")
print(2+1)
print(2-1)
print(2*1)
print(2/1)
print(2%1)


# In[3]:


print("----------Checking if the number is even or odd----------")
print("20 =",20%2)#even
print("45 =",45%2)#odd


# **Task:** Write an expression that equals 100.See if you can use more than one arithmetic operator!

# In[6]:


print(10**2)
print(110-10)
print(50+50)
print(10*10)
print(int(1000/10))


# <center><u>2. Variable Assignments on Python</u></center>
# 
# * Preferably keep the variable names in lower case
# * Avoid using built-in key word
# * Python is a dynmaic typic so we can reassign the varibles name.

# In[7]:


my_dog = "pug"
my_dog


# In[8]:


my_dog = "teo"
my_dog 
# reassigned !


# <center><u>3. Strings on Python</u></center>
# 
# * Strings are sequence of characters using either single/ double quotes
# * They are ordered sequences, which means we can index and slice.
# * Indexing starts from 0
# 

# In[10]:


my_string = "Hello World"
print("My typed string is:", my_string)


# In[11]:


print("The lenght of the string is: ",len(my_string))


# In[15]:


print("----------Indexing----------")
print("First letter: ",my_string[0])
print("7th letter: ",my_string[8])
print("second last letter: ",my_string[-2]) #reverse indexing starts from 1 


# In[23]:


print("----------Slicing----------")
print(my_string[2:])
print(my_string[:5])
print(my_string[6:9])


# **Task:** Write a string index that returns just the letter 'r'  from 'Hello World' . For example, 'Hello World'[0]  returns 'H' 
# You should only write one line of code for this. Do not assign a variable name to the string.

# In[24]:


my_string = "Hello World"
print("My typed string is:", my_string)


# In[25]:


print("returns just the letter r: ",my_string[-3])


# **Task:** Use string slicing to grab the word 'ink'  from inside 'tinker' For example, 'education'[3:6]  returns 'cat'  Remember that when slicing you only go up to but not including the end index. You should only write one line of code for this. Do not assign a variable name to the string.

# In[26]:


my_string = "tinker"
print("My typed string is:", my_string)


# In[27]:


print("slicing to grab the word ink : ",my_string[1:4])


# In[29]:


print("----------Property 01 : Immutability of strings----------")
my_String = "Sam"
print("My string:",my_String)
my_String[0] = "P"


# In[31]:


print("----------Property 02 : Concatenating of strings----------")
my_String = "Sam"
#slicing 
last_name =my_String[1:]
print("last name is", last_name)
print("Concatenating: ", 'P'+last_name)


# **Task:** Write an expression using any of the string formatting methods we have learned (except f-strings) to return the phrase 'Python rules!' For example, these phrases both return 'I like apples' : 'I like %s' %'apples'
# 'I like {}'.format('apples')
# Your solution should be entered on one line. You can not use variable names, only the strings themselves.

# In[35]:


print("1. Python rules!")
print('2. {}'.format('Python rules!'))


# <center><u>4. Lists on Python</u></center>
# 
# * ordered sequence that holds variety of data objects!
# * It is always in [] and commas used to separate the data objects.
# * slicing and indexing also possible

# In[37]:


my_list1 = [1,2,4,'a','Ammu']
my_list1


# In[38]:


print("Length :", len(my_list1))


# In[39]:


print("----------Indexing----------")
print(my_list1[0])
print(my_list1[-1])


# In[40]:


print("----------Slicing----------")
print(my_list1[1:])


# In[41]:


print("----------Contactenating lists----------")
my_list1 = [1,2,3,4]
my_list2 = ['a','b','c']
my_list3 = my_list1 + my_list2
print(my_list3)


# In[42]:


print("----------Property 01 : mutability of lists----------")
my_list1 = [1,2,3,4]
print(my_list1)
my_list1[0] = "Hello!"
print(my_list1)


# In[45]:


print("----------Property 02 : Adding elements at the end of lists----------")
my_list1 = [1,2,3,4]
print(my_list1)
my_list1.append(6)
print(my_list1)
my_list1.append("Hurray!")
print(my_list1)


# In[47]:


print("----------Property 03 : Removing elements at the end of lists----------")
my_list1 = [1,2,3,4]
print(my_list1)
my_list1.pop() #by default removes the last element
print(my_list1)
my_list1.pop(0) # put the index value
print(my_list1)


# In[48]:


print("----------Property 04 : Sorting elements of lists----------")
my_list1 = [10,2,33,14]
print(my_list1)
my_list1.sort()
print(my_list1)


# In[49]:


print("----------Property 04 : Reversing elements of lists----------")
my_list1 = [10,2,33,14]
print(my_list1)
my_list1.reverse()
print(my_list1)


# **Task:** 
# Create a list that contains at least one string, one integer and one float.
# 
# For example:
# 
# [1, 'two', 3.14159] 
# 
# Note that the order and number of items doesn't matter. 
# 
# The answer should just be one list on a single line. Don't assign a variable name to the list.

# In[50]:


["Gayatri",7,12.99]


# <center><u>5. Dictionaries on Python</u></center>
# 
# * unordered mapping of elements and cant be sorted!
# * uses {} and has a key value relationship.
# 

# In[53]:


my_dict1 = {'key1':'va1','key2':[1,2,3]}
print(my_dict1)
print(my_dict1['key2'])
