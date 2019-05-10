#!/bin/bash

kill_port() {
  lsof -i :$1 | tail -n1 | awk '{print $2}' | xargs -L1 kill -9 --verbose
}

