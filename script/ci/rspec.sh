#!/bin/bash

set -euo pipefail

rake db:reset

rspec spec