#!/bin/bash
function dfpc {
  df ${1:-/} | tail -1 | perl -nE 'say $1 if /(\d+)%/'
}
function delete_random_file {
  rm -f $(find ${1:-/} -xdev -type f | shuf -n1) 2> /dev/null
}
function random_name {
  perl -e'my @a = "a" .. "z"; print @a[rand @a] for 1 .. 8'
}
function create_random_file {
  FILE=$(find ${1:-/} -xdev -type d | shuf -n1)/$(random_name)
  dd if=/dev/zero of=$FILE bs=1024 count=$(perl -e 'print int rand 102400') 2> /dev/null
}

function ensure_storage_percent {
  MP=${1:-/}
  PC=$2
  while [ $(dfpc "$MP") -ne "$PC" ]; do
    while [ $(dfpc "$MP") -gt "$PC" ]; do
      delete_random_file $MP
    done
    while [ $(dfpc "$MP") -lt "$PC" ];do
      create_random_file $MP
    done
  done
}

ensure_storage_percent $1 $2
