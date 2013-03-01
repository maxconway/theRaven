.SUFFIXES: .params .smol

run :  ../experiments.csv ../experiments_more.csv ../generate_params.py ../use_params.py remove_results remove_smol
	cd ..; ./generate_params.py 'experiments.csv'; ./generate_params.py 'experiments_more.csv'
	../use_params.py
	make -j results
	

smoldynall : 
	smoldyn *.smol

%.params : 
	cd ..; ./generate_params.py 'experiments.csv'; ./generate_params.py 'experiments_more.csv'

results : remove_results ./source/* ../fly-template ./results_temp/default.result ./results_temp/model1.result ./results_temp/model2.result ./results_temp/model4.result ./results_temp/lowdif.result ./results_temp/highdif.result ./results_temp/lowdifs.result ./results_temp/highdifs.result ./results_temp/lowdifsl.result ./results_temp/highdifsl.result ./results_temp/model1-c.result ./results_temp/model2-c.result ./results_temp/model4-c.result ./results_temp/Lowdif-c.result ./results_temp/Highdif-c.result  ./results_temp/Lowdifs-c.result ./results_temp/Highdifs-c.result ./results_temp/Lowdifsl-c.result ./results_temp/Highdifsl-c.result ./results_temp/bcd_nos.result ./results_temp/Lowdifs-c-copy.result ./results_temp/bcd_nos.result ./results_temp/cadnoshhb_test.result ./results_temp/cad_test.result ./cadnoshb_transc.result
	cp ./results_temp/* ./results/

./results_temp/%.result : %.smol
	smoldyn $*.smol

remove_results : 
	rm -f ./results_temp/*

remove_smol :
	rm -f *.smol

clean : remove_results


