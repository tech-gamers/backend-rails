#!/bin/bash

bin/rails db:migrate
bin/rails assets:precompile
