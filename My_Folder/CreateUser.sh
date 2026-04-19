#!/bin/bash

# Script to create user usign a text file


# Steps to Create the User File
#
# 1. Import the text file
# 2. declare the output file for storing the password
# 3. using for loop read the file and create user profile and store there name along with password set. 
# 4. save the output file in the this directory only
#
#
# ######################################################
#
#
#set -x #debug mode
set -e #stops execution when ther is error

#importing user file
userFile='./userList.txt'


#Declareing the outputFile
outputFile="output.csv"

#adding headers the csv file

echo "userName,Password" > $outputFile


generate_password() {
		
  tr -dc 'A-Za-z0-9!@#$%' < /dev/urandom | head -c 12
	# tr -- translate command (replace one word with another)
	# -d = instead replacing its starts delete every words expect which are after declare after -c 
}

while  IFS= read -r userName ;do
	tempPass=$(generate_password)
	if (id -u "$userName"); then
		echo "User $userName already exists, Changing the default password"
	else
		echo "Createing user Profile for: $userName and password is $tempPass"
		useradd $userName -m 
	fi	
		usermod -aG sudo $userName
		usermod $userName -s /bin/bash
		echo "$userName:$tempPass" | chpasswd
		echo "$userName,$tempPass" >> $outputFile
done<$userFile




