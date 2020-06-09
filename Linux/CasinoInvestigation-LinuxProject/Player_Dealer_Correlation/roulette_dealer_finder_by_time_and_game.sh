
#!/usr/bin/bash

clear
echo Hello ! This script will give you the Employee who worked on a particular date and time for a particular game.
echo 
echo "Enter the date in this MMDD format - For instace  for March 10th please enter as 0310"
read  gamedate
echo "Enter the time HH:MM:SS AM/PM in this format - For instance 05:00:00 AM"
read gametime
echo "Enter the Casino Game Number ( Black Jack - 1 , Roulette - 2 , Texas Hold Em - 3  All three - Press ENTER"
echo "For instance for Roulette give the Casino Number as 2 "
echo "If you do not give any Casino Game Number , you will see the Employees who worked in three games for that date and time!"
read whichgame
echo ======================================================================================
echo
if [ "$whichgame" = "1" ]
then 	
     echo The Employee who worked  on this date  $gamedate and time $gametime  in  BLACK JACK  game was 
     echo 
     cat "$gamedate"_Dealer_schedule | awk -F'\t' '{print $1 " " $2} ' | grep "$gametime" | awk -F' ' '{print $3 " " $4}'
elif [ "$whichgame" = '2' ]
then	
     echo The Employee who worked  on this date  $gamedate and time $gametime in ROULETTE game was 
     echo 
     cat "$gamedate"_Dealer_schedule | awk -F'\t' '{print $1 " " $3} ' | grep "$gametime" | awk -F' ' '{print $3 " " $4}'
elif [ "$whichgame" = '3' ]
then
     echo The Employee who worked  on this date  $gamedate and time $gametime in TEXAS HOLD EM was 
     echo 
     cat "$gamedate"_Dealer_schedule | awk -F'\t' '{print $1 " " $4} ' | grep "$gametime" | awk -F' ' '{print $3 " " $4}'
else 
     echo The Employees  who worked  on this date  $gamedate and time $gametime  and the three ganmes were
     echo 
     cat "$gamedate"_Dealer_schedule | awk -F'\t' '{print $1 " " $2 " " $3 " " $4} ' | grep "Hour AM/PM" | awk -F' ' '{print $3 " " $4 "\t" $5 " " $6 "\t" $7 " " $8}'
     echo  
     cat "$gamedate"_Dealer_schedule | awk -F'\t' '{print $1 " " $2 " " $3 " " $4} ' | grep "$gametime" | awk -F' ' '{print $3 " " $4 "\t" $5 " " $6 "\t" $7 " " $8 "."}'
fi
echo
echo ======================================================================================

