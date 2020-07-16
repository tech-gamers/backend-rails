#!/bin/bash

if [ -f tmp/pids/server.pid ]; then
  rm -f tmp/pids/server.pid
fi

if [ ${RAILS_ENV} == 'development' && -n ${DEBUG} ]; then
  bin/rdebug-ide \
    --host 0.0.0.0 \
    --port ${DEBUG_PORT} \
    -- bin/rails s -p ${PORT} -b 0.0.0.0
else
  bin/rails s -p ${PORT} -b 0.0.0.0
fi
