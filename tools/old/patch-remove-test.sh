#/bin/sh

cat ../avorion-mothballing/patches/* | patch -p2 -R --dry-run
