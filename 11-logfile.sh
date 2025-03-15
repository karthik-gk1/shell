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
LOG_FOLDER="/var/log/shell-log"
LOG_FILE=$(echo $0 | cut -d "." -f1 )
TIMESTAMP=$(date +%Y-%m-%d-%H-%M-%S)
LOG_PATH="$LOG_FOLDER/$LOG_FILE-$TIMESTAMP.log"

echo "Script executing at: $TIMESTAMP" &>>$LOG_PATH

if [ $USERID -ne 0 ]
then 
    echo "you are not root user"
    exit 1 # other than zero manual exit status
fi

dnf list installed mysql &>>$LOG_PATH

if [ $? -ne 0 ]
then
    dnf install mysql -y &>>$LOG_PATH
    VALIDATE $? Mysql
else 
    echo -e "Mysql installed... $Y already $W"
fi 
