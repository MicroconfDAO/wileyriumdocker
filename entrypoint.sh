#!/usr/bin/env bash

privateKeyFile=$1
password=$2
email=$3

if [ -f "/app/account" ]
then
    # account found
    account=`cat /app/account`
else
    # init
    ./geth --datadir /app/data init ./wileyDAOGenesis.json

    # copy address
    cp ./static-nodes.json /app/data/geth/

    # import account
    echo $password > password
    ./geth --password ./password account import $privateKeyFile
    account=`./geth --datadir /app/data --password ./password account new | sed "s/[^{]\+{\([^}]\+\)}/\1/"`
    rm password

    #save account number
    echo $account /app/account

    # generate account
    # echo $spassword > password
    # account=`./geth --datadir /app/data --password ./password account new | sed "s/[^{]\+{\([^}]\+\)}/\1/"`
    # rm password

    # send email
    # mailMessage="privateKeyFile:$privateKeyFile/password:$password/account:$account"
    # echo $mailMessage
    # echo $email
    # npm run mail -- $email $mailMessage
fi

./geth --datadir /app/data/ --networkid 13 --nodiscover --mine --minerthreads=8 --etherbase 0xdF22381674dED825462795a4d6fb5A4BeEA95739