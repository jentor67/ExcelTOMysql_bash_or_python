# ExcelTOMysql_bash_or_python
Show 2 examples of code to upload 4 Excel files to MySql using bash and python

The computer I am using is a VM with Ubuntu 22.  The data resides on a RAID on the same Virtual machine as the VM.  I am using 12 cores but with no threading and 38Gigs of RAM.  Python is version 3.

In these examples I am reading in 4 Excel files with a combined line count of 1,056,184.  I tried to make the programs as simple as possible and just stuck to reading in the files and collecting the times it took.  In each folder there is a time or results txt file to show the time it took.  Except the final time all other instances where taken out for this purpose else the code would like messy.

With the python program I read each file into a DataFrame from pandas and combined them together.  The advantage of this is that it could analyse the data to determine the data type for each column.  The import of the data was also very simple and streamed line.

The bash side I had to convert the files to csv and combine them into one.  There was also the added complexity to create the table and define the columns. 

Results:
Python time: 182 sec.
Bash time: 109 sec.
Python lines of code: 21
Bash-Mysql lines of code: 25

Looking over the code the bash process was far more involved especially the sql file that is executed at the end of the bash script.  

If you are looking for an easy process, you have different layouts, and time is not a consideration then Python process is it.  If you this is going to be a repeated process and the layouts are the same then the Bash process is the way to go.
