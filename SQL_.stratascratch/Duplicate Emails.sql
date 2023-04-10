#Find all emails with duplicates.

# Table: employee


select 
  email
from employee
Group BY  email
Having Count(*) > 1
