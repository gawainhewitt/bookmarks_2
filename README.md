# Databases
---

## User Story
---
```
As a user
To be able to see my bookmarks
I'd like to see a list of my bookmarks
```

![Screenshot 2022-05-09 at 15 35 21](https://user-images.githubusercontent.com/58693804/167434450-912649f8-b31b-4554-95ba-abf046ecfc24.png)


------------------

## Database setup
1. Connect to psql
2. Create the database using the psql command CREATE DATABASE bookmark_manager;
3. Connect to the database using the pqsl command \c bookmark_manager;
4. Run the query we have saved in the file 01_create_bookmarks_table.sql

* To view table do. SELECT * FROM bookmarks;