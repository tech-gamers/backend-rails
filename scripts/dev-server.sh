#!/bin/bash

if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

if [ -z ${DEBUG} ]; then
  bin/rails s -p ${PORT} -b 0.0.0.0
else
  bin/rdebug-ide \
    --host 0.0.0.0 \
    --port ${DEBUG_PORT} \
    -- bin/rails s -p ${PORT} -b 0.0.0.0
fi
