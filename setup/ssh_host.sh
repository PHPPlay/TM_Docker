#!/bin/bash
ssh-keygen -R $1
ssh $1
