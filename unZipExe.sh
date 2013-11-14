cd temp

for f in *.exe
  do 
	echo "Unzipping file $f"
	crop=`echo $f | cut -d'_' -f 2`
	echo "Crop is $crop"
	unzip $f
	
	cd database/central
	mv full $crop
	mkdir $crop
	mv $crop ../../../central/

	cd ../local
	mv full $crop
	mkdir $crop
	mv $crop ../../../local/

	cd ../central_light
	mv full $crop
	mkdir $crop
	mv $crop ../../../central_light/
	
	cd ../../
	rm -rf database*
  done

rm -rf *.exe