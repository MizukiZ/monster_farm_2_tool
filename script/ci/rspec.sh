#! /bin/bash

set -euo pipefail

yarn install --check-files

rake db:reset

rspec spec