.SUFFIXES: .params .smol

run :  paramall
	make -k --jobs=`nproc` results

smoldynall : 
	smoldyn *.smol

paramall : ../experiments.csv ../experiments_more.csv ../generate_params.py ../use_params.py remove_results
	cd ..; ./generate_params.py 'experiments.csv'; ./generate_params.py 'experiments_more.csv'
	../use_params.py

results : ./results_temp/Bcd-nos.result ./results_temp/Cadnos-test.result ./results_temp/Caudal-test.result ./results_temp/default.result ./results_temp/Highdif-c.result ./results_temp/Highdifs-c.result ./results_temp/Highdifsl-c.result ./results_temp/highdifsl.result ./results_temp/highdif.result ./results_temp/highdifs.result ./results_temp/Lowdif-c.result ./results_temp/Lowdifs-c.result ./results_temp/Lowdifsl-c.result ./results_temp/lowdifsl.result ./results_temp/lowdif.result ./results_temp/lowdifs.result ./results_temp/Middif-c.result ./results_temp/Middifs-c.result ./results_temp/Middifsl-c-nos.result ./results_temp/Middifsl-c.result ./results_temp/middifsl.result ./results_temp/middif.result ./results_temp/middifs.result make./results_temp/model1-c.result ./results_temp/model1.result ./results_temp/model2-c.result ./results_temp/model2.result ./results_temp/model4-c.result ./results_temp/model4.result ./results_temp/Cadnoshb-test.result ./results_temp/Cadnoshb-transc.result
	cp ./results_temp/* ./results/

./results_temp/%.result : %.smol 
	smoldyn $*.smol

#%.smol : paramall

remove_results : 
	rm -f ./results_temp/*

remove_smol :
	rm -f *.smol

clean : remove_results


