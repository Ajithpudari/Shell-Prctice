#! /bin/bash

create(){
  echo "Enter the adress book name"
  read ab
	#check adress book available or not
  res=`ls | grep $ab | wc -w`

   if [ $res -gt 0 ]
   then
     echo "echo error file is existing"
  else
     touch $ab
     echo  "adress book created"
  fi
}

insert()
{
  echo "Enter the adress book name"
  read ab

  res=`ls | grep $ab | wc -w`

  if [ $res -gt 0 ]
  then
        echo "Enter email"
        read email

        #check email is present in adress book
       len=`cat $ab | grep $email | wc -w`
       if [ $len -gt 0 ]
       then
            echo "email already exist"
       else
            echo "Enter additinal Data"
            read fname lname mobileNumber

             record=`echo $fname $lname $mobileNumber $email`
             echo $record >> $ab
             echo "record inserted"
        fi
  else
        echo  "error file not  displaying file"
  fi
}

display(){
  echo "Enter the adress book name"
  read ab
  res=`ls | grep $ab | wc -w`
   if [ $res > 0 ]
   then
      cat $ab
   else
     echo  "error not displaying file"
   fi
}

modify()
{
  echo "Enter the adress book name"
  read ab

  res=`ls | grep $ab | wc -w`

  if [ $res -gt 0 ]
  then
        echo "Enter email"
        read email

        #check email is present in adress book
     len=`cat $ab | grep $email | wc -w`
       if [ $len -gt 0 ]
       then
            echo "enter the modified 1st name last name mobile"
            read fname lname mobileNumber
            new=`echo $fname $lname $mobileNumber $email`
            old=`cat $ab | grep $email`
             
            echo "Old Record : $old"
            echo "New Record : $new"
            
            sed -i s/"$old"/"$new"/g $ab
            
            echo "Record Modified"
     else
           echo "email not exist"

        fi
  else
        echo  "error file not exist"
  fi
}

delete()
{
  echo "Enter the adress book name"
  read ab

  res=`ls | grep $ab | wc -w`

  if [ $res -gt 0 ]
  then
        echo "Enter email"
        read email

        #check email is present in adress book
     len=`cat $ab | grep $email | wc -w`
       if [ $len -gt 0 ]
       then
            dlt=`cat $ab | grep $email`

             sed -i s/"$dlt"//g $ab
             echo "dlt Record : $dlt"


            echo "Record deleted"
       else
            echo "email not exist"

        fi
  else
        echo  "error file not exist"
  fi
}

while [ true ]
do  
       echo ***********menu*********
       echo "1. create"
       echo "2. insert"
       echo "3. display"
       echo "4. modify"
       echo "5. delete" 
       echo "7. Exit"

      echo "enter a choice"
      read choice

      case $choice in
          1) create ;;
          2) insert ;;
          3) display ;;
          4) modify ;;
          5) delete ;;
          7) exit ;;

          *) echo "wrong choice" ;;
      esac

done
#create adress book by  choosing 1st choice
#Than insertdata>enter adress book name > enter mail > than enter firstName,lastName,mobileNum,mail;
#modify : enter adressBookName > mail which record we want to modify >enter new data 
#delete : enter adresBookName > than mail which we we want delete.
#dispaly:enetr AdressBook name>mail display which we want to dasplay.
