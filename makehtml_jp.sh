#!/bin/bash

CURR_PATH=$PWD
TVM_PATH=$CURR_PATH/tvm
TVMDOC_BUILD_PATH=$TVM_PATH/docs

cd $TVMDOC_BUILD_PATH

git checkout -- $TVMDOC_BUILD_PATH/conf.py
sed -i "s/language = None/language = \"ja\"\nlocale_dirs = [\"locale\"]\ngettext_compact = False/" $TVMDOC_BUILD_PATH/conf.py

echo "Generating HTML artifacts in Japanese..."
make -e SPHINXOPS="-D language='ja'" html
git checkout -- $TVMDOC_BUILD_PATH/conf.py
cd $CURR_PATH
echo "Done!"