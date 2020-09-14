#!/bin/bash

echo ps -u $USER |grep -E 'memcached$'

if ps -u $USER |grep -E 'memcached$' > /dev/null
then
  echo "memcached is running."
else
  echo "starting memcache."
  /usr/bin/memcached -d -m 100 -s $HOME/tmp/memcached.sock -P $HOME/tmp/memcached.pid
fi
