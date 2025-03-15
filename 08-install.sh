#!/bin/bash 

USERID=$(id -u)

if [ $USERID -ne 0 ]
then 
    echo "you are not root user"
    exit 1 # other than zero manual exit status
fi

dnf install mysql -y

if [ $? -ne 0 ]
then 
    echo "Installing Mysql... Failure"
    exit 1
else 
    echo "Installing Mysql... Success"
fi
