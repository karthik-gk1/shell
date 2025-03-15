#!/bin/bash 

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
    if  [ $? -ne 0 ]
    then 
        echo "Installing... Falied"
        exit 1
    else 
        echo "Installin... Success"
    fi
else 
    echo "Mysql already installed"
fi 

# dnf install mysql -y

# if [ $? -ne 0 ]
# then 
#     echo "Installing Mysql... Failure"
#     exit 1
# else 
#     echo "Installing Mysql... Success"
# fi