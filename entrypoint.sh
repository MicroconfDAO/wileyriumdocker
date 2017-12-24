./geth version
#geth --datadir /var/wileydao/blockchain/chaindata init wileyDAOGenesis.json \
#nohup geth --datadir /var/wileydao/blockchain/chaindata --networkid 13 --nodiscover --rpc --rpcaddr "0.0.0.0" --rpcport 8545 --rpcapi "db,admin,debug,miner,shh,txpool,personal,eth,net,web3" --rpccorsdomain "*" > ./logs/gethnode1.log 2>&1 & \
#nohup geth --datadir /var/wileydao/blockchain/chaindata --networkid 13 --nodiscover > ./logs/gethnode1.log 2>&1 & \
#geth attach chaindata/geth.ipc