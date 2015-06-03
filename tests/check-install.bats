#!/usr/bin/env bats

@test "curl installed" { run curl --version;  [ $(expr "$output" : ".*curl 7.35.0"          ) -eq 11 ];}
@test "vim  installed" { run vim  --version;  [ $(expr "$output" : ".*VIM - Vi IMproved 7.4") -eq 21 ];}
@test "git  installed" { run git  --version;  [ "$output" = "git version 1.9.1"                      ];}
@test "bats installed" { run bats --version;  [ "$output" = "Bats 0.4.0"                             ];}
@test "node installed" { run node --version;  [ "$output" = "v0.12.4"                                ];}
@test "npm  installed" { run npm  --version;  [ "$output" = "2.11.0"                                 ];}
