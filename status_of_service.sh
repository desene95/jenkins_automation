

SHELL=/bin/bash
PATH=/sbin:/bin:/usr/sbin:/usr/bin

#!/bin/bash 

service jenkins status > output.txt
if grep -q "running" output.txt; then
echo "Jenkins service is running"
else
service jenkins start
echo "Jenkins is now running"
fi

