#!/usr/bin/env bats

@test "confirm GitHub ssh is correctly set" {
    run ssh git@github.com;
    [ "$status" -eq 1 ];      # when git key is not setup, the status is 255
  }
