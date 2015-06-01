#!/bin/bash
ssh-keygen -R $1
ssh root@$1
