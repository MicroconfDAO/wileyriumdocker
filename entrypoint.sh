#!/usr/bin/env bash

#copy account from the volume
cp /app/account ./ || true
#TODO: copy database from the volume

m="victornabatov@gmail.com"

if [ -f "account" ]
then
    echo "account found:\n"
    account=`cat account`
else
    echo "debug email = $1 password = $2"
    echo $2 > password
    echo "\ninit\n"
    ./geth --datadir ./data init ./wileyDAOGenesis.json
    echo "\ngenerate account\n"
    account=`./geth --datadir ./data --password ./password account new | sed "s/[^{]\+{\([^}]\+\)}/\1/"`
    rm password
    echo "$account" > account

    #copy account to the volume
    cp account /app

    mailMessage="account:$account/password:$2"
    echo "email message = $mailMessage"

    npm run mail -- $1 $mailMessage
fi


#start mining here

