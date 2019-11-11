#!/bin/base

base64_sha256_checksum() {
  echo `openssl dgst -binary -sha256 $1 | openssl base64`
}
