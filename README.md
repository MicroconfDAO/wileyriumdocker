# wileyriumdocker

## basic usage
    1) export  private key from metamask and save as pk.txt in project folder
    2) build.sh # --- only first time
    
    variant 1 semi-automaic, show logs
    3) docker run -it --name container1 -v test1vol:/app test1 /bin/bash
    4) ./entrypoint.sh pk.txt mypassword
    mining in progress
    5) to stop - CTRL+C, CTRL+D
    6) docker ps
    7) docker stop 'containerid'

    variant 2 automatic, hide logs
    3) ./run.sh pk.txt mypassword 
    mining in progress
    4) to stop run stop.sh 

---
    
## build.sh 
builds an image and creates a volume to save the data

## run.sh 
executes entrypoint.sh in the docker container
parameters

| Name                     | Required |
| :----------------------- | :------: |
| Private Key File Name    | +        |
| Password                 | +        |


## entrypoint.sh 

imports account and starts mining
    
## stop.sh 
stops all processes removes containers, data is saved in the volume

