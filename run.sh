#!/usr/bin/env bash
docker run -i test1 sh entrypoint.sh mail pass account1
#docker commit --change='CMD ["sh", "entrypoint.sh", "to@to.com", "password"]'  -c "EXPOSE 80" 0ff5638e983d test
