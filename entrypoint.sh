#!/usr/bin/env bash

if [ -z "$3" ]
then
    echo "debug email = $1 password = $2"
    echo $2 > password
    echo "\ninit\n"
    ./geth --datadir ./data init ./wileyDAOGenesis.json
    echo "\ngenerate account\n"
    logs=`./geth --datadir ./data --password ./password account new`
    account=`echo $logs | sed "s/[^{]\+{\([^}]\+\)}/\1/"`
    mailMessage="account:$account password: $2"
    echo "$account" > account
    ls -la
    rm password
    echo "email message = $mailMessage"
    #npm run mail -- $1 $mailMessage
else
    echo "account found: $3"
fi

