#!/bin/sh

app_path="/home/deploy/app/current"
ACTION=$1
ROLE=$2

mkdir -p $app_path/log

case $ACTION in
	start)
	echo -n "Starting delayed_job: "
	sudo su - deploy -c "cd $app_path && ./bin/delayed_job --pool=$ROLE:2 start >> $app_path/log/delayed_job.log";
	echo "done."
	;;
	stop)
	echo -n "Stopping delayed_job: "
	sudo su - deploy -c "cd $app_path && ./bin/delayed_job stop >> $app_path/log/delayed_job.log";
	echo "done."
	;;
	*)
	echo "Usage: $N {start|stop}" >&2
	exit 1
	;;
esac
exit 0
