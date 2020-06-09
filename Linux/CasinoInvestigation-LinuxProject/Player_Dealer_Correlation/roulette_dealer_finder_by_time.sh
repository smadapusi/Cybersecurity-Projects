
#!/usr/bin/bash

clear
echo Hello ! This script will give you the dealer who worked on a particular date and time.
echo 
echo "Enter the date in this MMDD format - For instace  for March 10th please enter as 0310"
read  gamedate
echo "Enter the time HH:MM:SS AM/PM in this format - For instance 05:00:00 AM"
read gametime
echo ======================================================================================
echo
echo The Dealer who worked  on this date  $gamedate and time $gametime was 
echo 
cat "$gamedate"_Dealer_schedule | awk -F'\t' '{print $1 " " $3} ' | grep "$gametime" | awk -F' ' '{print $3 " " $4}'
echo
echo ======================================================================================

