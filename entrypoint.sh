#!/usr/bin/env bash

if [ -f "account" ]
then
    # account found
    account=`cat account`
    mailMessage="account_found:$account"
    npm run mail -- $1 $mailMessage
else
    # init
    ./geth --datadir ./data init ./wileyDAOGenesis.json

    # generate account
    echo $2 > password
    account=`./geth --datadir ./data --password ./password account new | sed "s/[^{]\+{\([^}]\+\)}/\1/"`
    rm password

    # save account
    echo $account > account

    # send email
    mailMessage="account_created:$account/password:$2"
    npm run mail -- $1 $mailMessage
fi

#TODO: start mining here

