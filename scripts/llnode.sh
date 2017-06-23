#!/bin/sh

echo $PATH

LLNODE_SCRIPT=`node -p "path.resolve('$0')"`

echo $LLNODE_SCRIPT

SCRIPT_PATH=`dirname $LLNODE_SCRIPT`
if [ `basename $SCRIPT_PATH` == ".bin" ]; then
  # llnode installed locally in node_modules/.bin
  LLNODE_PLUGIN="$SCRIPT_PATH/../llnode/llnode.dylib"
else
  # llnode installed globally in lib/node_modules
  LLNODE_PLUGIN="$SCRIPT_PATH/../lib/node_modules/llnode/llnode.dylib"
fi

lldb --one-line "plugin load $LLNODE_PLUGIN" --one-line "settings set prompt (llnode)" $@
