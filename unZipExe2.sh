cd temp

for f in *.exe
  do 
	echo "Unzipping file $f"
	crop=`echo $f | cut -d'_' -f 2`
	echo "Crop is $crop"
	unzip $f
	
	cd database/central
	mv $crop ../../../central/
	cd ../local
	mv $crop ../../../local
	cd ../update
	mv $crop ../../../update

  done

