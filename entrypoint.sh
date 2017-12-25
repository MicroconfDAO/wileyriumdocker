#!/usr/bin/env bash

if [ -f "/app/account" ]
then
    # account found
    account=`cat /app/account`
else
    # init
    ./geth --datadir /app/data init ./wileyDAOGenesis.json

    # generate account
    echo $2 > password
    account=`./geth --datadir /app/data --password ./password account new | sed "s/[^{]\+{\([^}]\+\)}/\1/"`
    rm password

    # copy account to the volume
    echo $account > /app/account

    # send email
    mailMessage="account:$account/password:$2"
    npm run mail -- $1 $mailMessage
fi

#TODO: start mining here

nohup geth --datadir /app/data --etherbase "0x$account" --mine --minerthreads=4