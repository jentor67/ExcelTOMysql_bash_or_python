#!/usr/bin/bash
prefix="transactions"
#prefix="test"
start_time=`date +%s.%N`

convert_xlsx () {
    echo "Convet file "$prefix"$1.xlsx to csv"
    xlsx2csv /raidLocal/jmajor/PTI/readExcelFiles/Data/"$prefix"$1.xlsx > output$1.csv
}

## convert Excel files to CSV
convert_xlsx "1"

convert_xlsx "2"

convert_xlsx "3"

convert_xlsx "4"


# remove first line
echo "$(tail -n +2 output2.csv)" > output2.csv
echo "$(tail -n +2 output3.csv)" > output3.csv
echo "$(tail -n +2 output4.csv)" > output4.csv


# concantanate files
cat output1.csv output2.csv output3.csv output4.csv > output.csv

# remove working files
rm output1.csv output2.csv output3.csv output4.csv

PASSWORD=$(<bin/password.txt)

# import csv into mysql
mysql -u jmajor -p"$PASSWORD" < importCSV.sql 

end_time=`date +%s.%N`
echo "--- " $(echo "$end_time - $start_time" | bc -l ) " seconds to complete process"
