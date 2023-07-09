#!/bin/bash
: 'This creates the 3 groups'

sudo groupadd -f Developers
sudo groupadd -f Data_Analysts
sudo groupadd -f Operations

: 'This creates the Developers directory, dummy files, changes the ownership and permissions of everything to the specific group'

sudo mkdir -p Development
cd Development
sudo touch Development_Projects KeyPairs Scrum_Notes
sudo chmod uo-rwx Development_Projects KeyPairs Scrum_Notes
sudo chmod g+rwx Development_Projects KeyPairs Scrum_Notes
sudo chown :Developers Development_Projects KeyPairs Scrum_Notes
cd ..
sudo chmod uo-rwx Development
sudo chmod g+rwx Development
sudo chown :Developers Development

: 'This creates the Data Analysts directory dummy files, changes the ownership and permissions of everything to the specific group'

sudo mkdir -p Analytics
cd Analytics
sudo touch Database Projects Shared
sudo chmod uo-rwx Database Projects Shared
sudo chmod g+rwx Database Projects Shared
sudo chown :Data_Analysts Database Projects Shared
cd ..
sudo chmod uo-rwx Analytics
sudo chmod g+rwx Analytics
sudo chown :Data_Analysts Analytics

: 'This creates the Operations directory dummy files, changes the ownership and permissions of everything to the specific group'

sudo mkdir -p Operations
cd Operations
sudo touch Daily_Ops_Tasks Ops_CheckList Important
sudo chmod uo-rwx Daily_Ops_Tasks Important Ops_CheckList
sudo chmod g+rwx Daily_Ops_Tasks Important Ops_CheckList
sudo chown :Operations Daily_Ops_Tasks Important Ops_CheckList
cd ..
sudo chmod uo-rwx Operations
sudo chmod g+rwx Operations
sudo chown :Operations Operations

: ‘This creates the 3 users and assign them to the groups’

username1=("jwaller")

for username1 in "${username1}"
do
    sudo useradd -c "Jess Waller <jwaller@levelupbank.com>" -m -s /bin/bash "$username1"
    echo "$username1:Welcome123456" | sudo chpasswd
    sudo chown -R "$username1:$username1" "/home/$username1"
    sudo chmod 700 "/home/$username1"
    sudo usermod -aG Developers "$username1"
done

username2=("bdorsey")

for username2 in "${username2}"
do
    sudo useradd -c "Blake Dorsey <bdorsey@levelupbank.com>" -m -s /bin/bash "$username2"
    echo "$username2:Welcome123456" | sudo chpasswd
    sudo chown -R "$username2:$username2" "/home/$username2"
    sudo chmod 700 "/home/$username2"
    sudo usermod -aG Operations "$username2"
done

username3=("jewart")

for username3 in "${username3}"
do
    sudo useradd -c "Joey Ewart <jewart@levelupbank.com>" -m -s /bin/bash "$username3"
    echo "$username3:Welcome123456" | sudo chpasswd
    sudo chown -R "$username3:$username3" "/home/$username3"
    sudo chmod 700 "/home/$username3"
    sudo usermod -aG Developers "$username3"
done

echo "All user groups, directories and users were created successfully with proper permissions"