#!/bin/bash
# this script does what?
EXPECTED_ARGS=1 # change value to suit!
# some quick "argument accounting"
if [ $# -ne $EXPECTED_ARGS ]; then
        echo "This script runs a docker image on a local machine"
        echo "It requires one argument: the name of the docker image, which of course should already be built (i.e. visible via \"docker image ls\""
        echo "Note here how a database from outside the docker is being used and therefore the system's mysqld run folder is passed in."
        exit
fi
container="$1"
echo $HOME

docker run -d --hostname "$container" -p 8000:8000 $container
