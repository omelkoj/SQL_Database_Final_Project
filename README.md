# SQL_Database_Final_Project

For this project, I used the same CSV that I used for my Python project. I chose to import it into SSIS using one CSV file, and then use a conditional split to create the tables directly in MSSMS. That way, all the data and inital table organization is already in Microsoft SQL Server once you get there.

I decided to organize my tables according to the participation criteria. The rest of the rows are heavily correlated to the musical_participation column, so I figured it would make the most sense to take that direction. Once everything was imported through SSIS, I did go ahead and make some modifications to the table structure so that it was a bit more neat and clean. Some of these changes were to make one table for the two different types of engagement - vocal and instrumental - as well as a new table for the stored procedure to put the values into.

I also created a primary key for each table, since each row has a uniqe combination of grades/participation/etc. I aloso created a view that joined together all of the participation tables, so that the viewer could more easily see how all the grades compare to each other by participation.

I thought it would be good to have the functionality of a stored procedure calling a couple of functions that I made, and inserting them into a new table so the user can see averages, and also calculate averages if the database were to become larger.

I learned a lot through this project, and at some point I think I may go back and redo it and see if I can improve on my current work!
