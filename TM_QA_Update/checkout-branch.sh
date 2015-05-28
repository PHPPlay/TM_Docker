#!/bin/sh

echo Checkout Design branch $1
echo Checkout GraphDB branch $2

cd TM_4_0_Design
git pull origin $1:$1
git checkout $1
cd ../TM_4_0_GraphDB
git pull origin $2:$2
git checkout $2
cd ..

bin/start-servers.sh
