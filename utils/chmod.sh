#!/bin/sh

CURRENT_DIR='/home/dimyan/public_html/muhovyaz.dev/public/'

cd $CURRENT_DIR

echo "Write permissions on folders (do not apply recursively/to subfolders):"

chmod  777 config
chmod 777 tools/smarty/compile
chmod 777 tools/smarty/cache
chmod 777 tools/smarty_v2/compile
chmod 777 tools/smarty_v2/cache
chmod 777 sitemap.xml

echo "Write permissions on folders and subfolders/recursively:"

chmod -R 777 img
chmod -R 777 mails
chmod -R 777 modules
chmod -R 777 cache
chmod -R 777 themes/prestashop/lang
chmod -R 777 themes/prestashop/cache
chmod -R 777 themes/muhovyaz/lang
chmod -R 777 themes/muhovyaz/cache
chmod -R 777 translations
chmod -R 777 upload
chmod -R 777 download

#ROOT_DIR=$1
#DIR_PERM=$2
#FILE_PERM=$3

#for name in $(find ${ROOT_DIR})
#do
#if [ -d $name ]
#then
#chmod ${DIR_PERM} ${name}
#echo "DIRECTORY: '${name}' PERMS CHANGED TO 0x${DIR_PERM}"
#else
#chmod ${FILE_PERM} ${name}
#echo "FILE: '${name}' PERMS CHANGED TO 0x${FILE_PERM}"
#fi
#done


