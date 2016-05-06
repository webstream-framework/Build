#!/bin/bash
set -eo pipefail

cd /var/www/html
git clone https://github.com/webstream-framework/Test.git
rsync -a /tmp/Test /var/www/html
apache2-foreground
