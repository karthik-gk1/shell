#!/bin/bash

VALIDATE() {
    if  [ $1 -ne 0 ]
    then 
        echo "Installing $2... Falied"
        exit 1
    else 
        echo "Installing $2... Success"
    fi
}

USERID=$(id -u)

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
    echo "Mysql already... installed"
fi 