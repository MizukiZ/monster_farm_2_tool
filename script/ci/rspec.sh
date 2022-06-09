#! /bin/bash

set -euo pipefail

yarn add --check-files

rake db:reset

rspec spec