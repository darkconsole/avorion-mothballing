#/bin/sh

cat ../avorion-mothballing/patches/* | patch -p2 --dry-run
