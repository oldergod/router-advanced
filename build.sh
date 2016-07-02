#!/bin/bash

TARGET=ui-element-samples

[ -e $TARGET ] && rm -rf $TARGET

git clone https://github.com/GoogleChrome/ui-element-samples.git &&
scp -r $TARGET/router-advanced/* .

CURRENT_HASH=$(cd $TARGET;git rev-parse --short HEAD)

rm -rf $TARGET
git diff-index --quiet HEAD -- && exit("no changes")

git add --all . &&
git commit -m "updated the copy of advanced router to $CURRENT_HASH"

echo "done, should only git push origin gh-pages"
