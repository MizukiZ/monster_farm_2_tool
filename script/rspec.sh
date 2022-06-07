#!/bin/bash

set -euo pipefail

echo "--- setup database"
./bin/rake db:setup

echo "--- rspec"
./bin/rspec