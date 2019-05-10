#!/bin/bash

encode_base64() {
  local mime=`file --mime-type -b $1`
  local body=`cat $1 | openssl base64 | tr -d '\n'`

  echo "data:$mime;base64,$body"
}
