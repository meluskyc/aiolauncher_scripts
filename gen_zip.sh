#!/bin/sh

rm -rf scripts.zip
zip -r scripts.zip -j main/*.lua community/*.lua ru/*.lua
md5sum scripts.zip | cut -d " " -f 1 > scripts.md5
