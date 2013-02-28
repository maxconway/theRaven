.SUFFIXES: .params .smol

%.smol : %.params
	../use_params.py $*.params $*.smol

run : ./results/default-pbcd.result ./results/default-mbcd.result ./results/model1-pbcd.result ./results/model1-mbcd.result ./results/model2-pbcd.result ./results/model2-mbcd.result ./results/model4-pbcd.result ./results/model4-mbcd.result ./results/lowdif-pbcd.result ./results/lowdif-mbcd.result ./results/highdif-pbcd.result ./results/highdif-mbcd.result ./results/lowdifs-pbcd.result ./results/lowdifs-mbcd.result ./results/highdifs-pbcd.result ./results/highdifs-mbcd.result ./results/lowdifsl-pbcd.result ./results/lowdifsl-mbcd.result ./results/highdifsl-pbcd.result ./results/highdifsl-mbcd.result ./results/model1-c-pbcd.result ./results/model1-c-mbcd.result ./results/model2-c-pbcd.result ./results/model2-c-mbcd.result ./results/model4-c-pbcd.result ./results/model4-c-mbcd.result ./results/Lowdif-c-pbcd.result ./results/Lowdif-c-mbcd.result ./results/Highdif-c-pbcd.result ./results/Highdif-c-mbcd.result ./results/Lowdifs-c-pbcd.result ./results/Lowdifs-c-mbcd.result ./results/Highdifs-c-pbcd.result ./results/Highdifs-c-mbcd.result ./results/Lowdifsl-c-pbcd.result ./results/Lowdifsl-c-mbcd.result ./results/Highdifsl-c-pbcd.result ./results/Highdifsl-c-mbcd.result ./results/caudal_test-pbcd.result ./results/caudal_test-mbcd.result

results/%-pbcd.result results/%-mbcd.result : %.smol ./source/*
	rm -f ./results/$*-*
	smoldyn $*.smol


%.params : ../experiments.csv ../generate_params.py
	cd ..; ./generate_params.py

clean :
	rm -f *~
	rm -f *.smol
	rm -f *.params
	rm -f ./results/*.result
	rm -f ./results/*~
