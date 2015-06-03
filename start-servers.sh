#!/bin/bash

echo Starting TM_4_0_Design

cd TM_4_0_Design
node app.js &
cd ..

echo Starting TM_4_0_GraphDB

cd TM_4_0_GraphDB
node index.js &
cd ..

wait
