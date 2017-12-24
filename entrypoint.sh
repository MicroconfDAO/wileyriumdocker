#!/usr/bin/env bash

# copy account from the volume
cp /app/account ./ || true

# TODO: copy database from the volume


if [ -f "account" ]
then
    # account found
    account=`cat account`
else
    # init
    ./geth --datadir ./data init ./wileyDAOGenesis.json

    # generate account
    echo $2 > password
    account=`./geth --datadir ./data --password ./password account new | sed "s/[^{]\+{\([^}]\+\)}/\1/"`
    rm password

    # copy account to the volume
    echo $account > /app/account

    # send email
    mailMessage="account:$account/password:$2"
    npm run mail -- $1 $mailMessage
fi

#TODO: start mining here

