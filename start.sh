#! /bin/bash

until PORT=8081 bin/hubot --adapter slack; do
    echo "Server 'myserver' crashed with exit code $?.  Respawning.." >&2
    sleep 10
done
