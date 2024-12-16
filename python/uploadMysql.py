#!/usr/bin/python3
import pandas as pd
from sqlalchemy import create_engine
import time

start_time = time.time()

def readIntoDF(path,file):
    print("Read file " + file)
    df = pd.read_excel(path + file, sheet_name='Sheet1', header=0)

    return df


#read password file and remove \n'
db_password = open('bin/password.txt', 'r').read().replace('\n','')

db_login = 'jmajor' 
db_ip_address = 'localhost'  
port="3306" # mysql>SHOW GLOBAL VARIABLES LIKE 'PORT';
database="transactions"

transactions=pd.DataFrame()

dataPath = '/raidLocal/jmajor/PTI/readExcelFiles/Data/'

prefix = "transactions"
#prefix = "test"


## read data into data frame
transactions1 = readIntoDF(dataPath, prefix + "1.xlsx")

transactions2 = readIntoDF(dataPath, prefix + "2.xlsx")

transactions3 = readIntoDF(dataPath, prefix + "3.xlsx")

transactions4 = readIntoDF(dataPath, prefix + "4.xlsx")


#combines data frames
transactions = pd.concat([transactions1, transactions2, transactions3, transactions4], 
    ignore_index=True, sort=False)

#Create mysql engine
engine = create_engine(
    f"mysql+mysqldb://{db_login}:{db_password}@{db_ip_address}:{port}/{database}",
    echo=False,
    future=True)

#upload Excel file
transactions.to_sql(name="xlsxFile", con=engine, if_exists='replace')
print("--- %s seconds Total time---" % (time.time() - start_time))
