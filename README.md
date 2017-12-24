# wileyriumdocker

## basic usage
    build.sh # --- only first time
    run.sh to@to.com mypassword
    
mining...
    
    stop.sh 
    
---
    
## build.sh 
builds an image and creates a volume to save the data

## run.sh 
executes entrypoint.sh in the docker container
parameters

| Name          | Required |
| :------------ | :------: |
| email         | +        |
| password      | +        |

example

    run.sh to@to.com mypassword

## entrypoint.sh 
(starts from run.sh do not try to run manually)

1. only first run: sends email message with account and pass

**[in development]** 2. every run: starts mining
    
## stop.sh 
stops all processes removes containers, data is saved in the volume

