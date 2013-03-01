.SUFFIXES: .params .smol

paramall :  ../experiments.csv ../experiments_more.csv ../generate_params.py ../use_params.py
	cd ..; ./generate_params.py 'experiments.csv'; ./generate_params.py 'experiments_more.csv'
	 ../use_params.py

smoldynall : 
	smoldyn *.smol

%.params : 
	cd ..; ./generate_params.py 'experiments.csv'; ./generate_params.py 'experiments_more.csv'

run : ./source/* ../fly-template ./results/default-mbcd.result ./results/model1-mbcd.result ./results/model2-mbcd.result ./results/model4-mbcd.result ./results/lowdif-mbcd.result ./results/highdif-mbcd.result ./results/lowdifs-mbcd.result ./results/highdifs-mbcd.result ./results/lowdifsl-mbcd.result ./results/highdifsl-mbcd.result ./results/model1-c-mbcd.result ./results/model2-c-mbcd.result ./results/model4-c-mbcd.result ./results/Lowdif-c-mbcd.result ./results/Highdif-c-mbcd.result  ./results/Lowdifs-c-mbcd.result ./results/Highdifs-c-mbcd.result ./results/Lowdifsl-c-mbcd.result ./results/Highdifsl-c-mbcd.result ./results/bcd_nos-mbcd.result ./results/Lowdifs-c-copy-mbcd.result

./results/%-mbcd.result : %.smol
	smoldyn $*.smol

remove_results : 
	rm -f *.smol ../results/*

clean : remove_results
	rm -f *.params *.smol
