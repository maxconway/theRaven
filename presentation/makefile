realtime :
	ffmpeg -r 1 -qscale 1 -i ./movie-cropped/frame%03d.tif realtime.mp4

fast :
	ffmpeg -r 10 -qscale 1 -i ./movie-cropped/frame%03d.tif fast.mp4

crop :
	cd movie; mogrify -path ../movie-cropped -crop '450x200+710+400' *.tif

update-frames :
	rsync ../smoldyn/experiments/movie/* ./movie/


