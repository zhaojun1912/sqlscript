newdir=$1
if [ -z $newdir ]; then
	echo "Error, filename needed!"
	exit
fi

olddir=`ls -lrt |grep ^d|tail -1|awk '{print $9}'`
cp -R $olddir $newdir
cd $newdir


echo "DONE!"
