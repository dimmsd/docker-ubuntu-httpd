#!/bin/sh
set -e

# check last commit image
# 0 is TEST PASS
# 1 is TEST FAILURE

docker exec -it con-$HTTPD_IMAGE  /usr/local/bin/test6.sh | grep $COMMIT

result=$(docker exec  -it con-$HTTPD_IMAGE  /usr/local/bin/test6.sh | grep -q  $COMMIT)

exit $result
