#!/bin/bash
cd /home/appuser
git clone -b cloud-testapp https://github.com/Otus-DevOps-2018-05/xZ4PH0Dx_infra.git scripts
sudo ./scripts/install_mongod.sh &&
sudo ./scripts/install_ruby.sh &&
sudo ./scripts/deploy.sh
rm -f scripts

