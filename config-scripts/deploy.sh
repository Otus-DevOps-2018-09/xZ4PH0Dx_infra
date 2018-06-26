#!/bin/bash
git clone -b monolith http://github.com/express42/reddit.git
cd reddit && bundle install
puma -d

