#!/usr/bin/env bash

if [ -f "account" ]
then
    echo "account found:\n"
    cat account
else
    echo "debug email = $1 password = $2"
    echo $2 > password
    echo "\ninit\n"
    ./geth --datadir ./data init ./wileyDAOGenesis.json
    echo "\ngenerate account\n"
    account=`./geth --datadir ./data --password ./password account new | sed "s/[^{]\+{\([^}]\+\)}/\1/"`
    rm password
    echo "$account" > account

    mailMessage="account:$account password: $2"
    echo "email message = $mailMessage"
    #npm run mail -- $1 $mailMessage
fi

cat account
#start mining here

