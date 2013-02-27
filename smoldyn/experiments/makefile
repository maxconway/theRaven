.SUFFIXES: .params .smol

.params.smol:
	../use_params.py $< $@

run : ./results/default-pbcd.result ./results/default-mbcd.result ./results/model1-pbcd.result ./results/model1-mbcd.result ./results/model2-pbcd.result ./results/model2-mbcd.result ./results/model4-pbcd.result ./results/model4-mbcd.result ./results/lowdif-pbcd.result ./results/lowdif-mbcd.result ./results/highdif-pbcd.result ./results/highdif-mbcd.result ./results/lowdifs-pbcd.result ./results/lowdifs-mbcd.result ./results/highdifs-pbcd.result ./results/highdifs-mbcd.result

./results/%-pbcd.result ./results/%-mbcd.result : %.smol ./source/*
	rm ./results/$*-*
	smoldyn $*.smol


%.params : ../experiments.csv ../generate_params.py
	cd ..; ./generate_params.py
