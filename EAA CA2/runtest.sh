#!/bin/bash

# Print the column headers 5 spaces apart to a file called results.dat
printf "%-5s %-5s %-5s \n" "C0" "N" "Idle" > results.dat;


for i in {1..50}
do

# Display each user
echo "User: $i" 

# Run the loadtest for each user for a specified time, 10 seconds in this case.The & will make the loadtest run in the background.
timeout 10 ./loadtest $i &

# Create a variable and store the number of transactions for each user.
numTransactions=`wc -l < synthetic.dat`

# Run mpstat on only the 1 processor displaying the information for every second of the 10 seconds that each loadtest is ran for.
# Use the awk command to print the Average for each user and print the 12th column which displays the idle time of the CPU.
CPUIdle=$(mpstat -P 0 1 10 | awk '/Average/ {print $12}')

# Print the results for each user to the results.dat file.
printf "%-5s %-5s %-5s \n" "$numTransactions" "$i" "$CPUIdle" >> results.dat
done 


