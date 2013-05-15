#!/bin/sh

## set up postgres (in this case 9.0 from macports
export PGCTL=/usr/local/bin/pg_ctl
export PGDATA=/Volumes/pgtmp/postgres

case $1 in 
	start)
		## Make a RAM filesystem
		diskutil erasevolume HFS+ "pgtmp" `hdiutil attach -nomount ram://1048576`
		## start postgres
		${PGCTL} -D ${PGDATA} init
		${PGCTL} -D ${PGDATA} start
		sleep 2;
		;;
	stop)
		## stop postgres
		${PGCTL} -D ${PGDATA} stop
		## poof!
		umount /Volumes/pgtmp
		;;
esac
