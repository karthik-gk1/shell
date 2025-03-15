#!/bin/bash

VALIDATE() {
    if  [ $1 -ne 0 ]
    then 
        echo -e "Installing $2... $R Falied $W"
        exit 1
    else 
        echo -e "Installing $2... $G Success $W"
    fi
}

USERID=$(id -u)
R="\e[31m"
G="\e[32m"
Y="\e[33m"
W="\e[0m"

if [ $USERID -ne 0 ]
then 
    echo "you are not root user"
    exit 1 # other than zero manual exit status
fi

dnf list installed mysql

if [ $? -ne 0 ]
then
    dnf install mysql -y
    VALIDATE $? Mysql
else 
    echo -e "Mysql installed... $Y already $W"
fi