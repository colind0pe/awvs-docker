#!/bin/bash

docker pull xrsec/awvs
docker run -d -it -p 3443:3443 --restart=always --add-host=updates.acunetix.com:127.0.0.1 \
	--add-host=erp.acunetix.com:127.0.0.1 --name awvs xrsec/awvs
docker cp license_info.json awvs:/home/acunetix/.acunetix/data/license/
docker cp wa_data.dat  awvs:/home/acunetix/.acunetix/data/license/
docker exec awvs chmod 444 /home/acunetix/.acunetix/data/license/license_info.json
