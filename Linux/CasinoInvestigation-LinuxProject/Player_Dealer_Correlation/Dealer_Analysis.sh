
  cat 0310_Dealer_schedule | awk -F'\t' '{print $1 " " $3} ' | grep -e '05:00:00 AM' -e '08:00:00 AM' -e '02:00:00 PM' -e '08:00:00 PM' -e '11:00:00 PM' > Dealers_working_during_losses
  cat 0312_Dealer_schedule | awk -F'\t' '{print $1 " " $3} ' | grep -e '05:00:00 AM' -e '08:00:00 AM' -e '02:00:00 PM' -e '08:00:00 PM' -e '11:00:00 PM' >> Dealers_working_during_losses
  cat 0315_Dealer_schedule | awk -F'\t' '{print $1 " " $3} ' | grep -e '05:00:00 AM' -e '08:00:00 AM' -e '02:00:00 PM' >> Dealers_working_during_losses
  echo  The Primary Dealer that was working the times the losses occurred was :: > Notes_Dealer_Analysis 
  cat Dealers_working_during_losses | awk -F" " '{print $3 " " $4}' | uniq >> Notes_Dealer_Analysis
  echo  Total Number of times the dealer worked when major losses occurred was :: >> Notes_Dealer_Analysis
  cat Dealers_working_during_losses | grep -i 'Billy Jones' | wc -l >> Notes_Dealer_Analysis
