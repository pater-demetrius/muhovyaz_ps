#!/bin/sh

ACTION='backup'

DIR_NAME=`dirname $0`
DATA_DIR=$DIR_NAME/data
DB_USER=root
DB_PASS=yGZO7ne7Un

while getopts ":r" OPTION; do
	case $OPTION in
                r )
			ACTION='restore'
                        ;;
                * )
                        echo "Unknown option"
                        ;;
        esac
done

if [ 'backup' = $ACTION ]; then
	echo "Backup database."
	
	mkdir -p $DATA_DIR

	if [ -f $DATA_DIR/vilaviweb.sql ]; then
		echo -n "Found old data. Are you sure to overwrite? (y/n)"
		read input
		
		if [ $input != 'y' ]; then
			exit 1;
		fi
	fi

	mysqldump -u$DB_USER -p$DB_PASS --dump-date --triggers --routines vilaviweb > $DATA_DIR/vilaviweb.sql
	
	echo "Done."
fi

if [ 'restore' = $ACTION ]; then
	echo "Restore database..."

	if [ ! -f $DATA_DIR/vilaviweb.sql -o ! -f $DATA_DIR/vilaviweb.sql ]; then
		echo "database backup not found (run" `basename $0` "first)."
		exit 2;
	fi

	echo "DROP DATABASE vilaviweb" | mysql -u$DB_USER -p$DB_PASS
	echo "CREATE DATABASE vilaviweb DEFAULT CHARSET=utf8" | mysql -u$DB_USER -p$DB_PASS
	cat $DATA_DIR/vilaviweb.sql | mysql -u$DB_USER -p$DB_PASS vilaviweb

	echo "Done."
fi

exit 0;
