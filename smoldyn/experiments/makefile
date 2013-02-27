.SUFFIXES: .params .smol

.params.smol:
	../use_params.py $< $@

run : ./results/default-pbcd.result ./results/default-mbcd.result ./results/model1-pbcd.result ./results/model1-mbcd.result ./results/model2-pbcd.result ./results/model2-mbcd.result ./results/model4-pbcd.result ./results/model4-mbcd.result ./results/lowdif-pbcd.result ./results/lowdif-mbcd.result ./results/highdif-pbcd.result ./results/highdif-mbcd.result ./results/lowdifs-pbcd.result ./results/lowdifs-mbcd.result ./results/highdifs-pbcd.result ./results/highdifs-mbcd.result

./results/default-pbcd.result ./results/default-mbcd.result : default.smol ./source/*
	smoldyn default.smol
./results/model1-pbcd.result ./results/model1-mbcd.result : model1.smol ./source/*
	smoldyn model1.smol
./results/model2-pbcd.result ./results/model2-mbcd.result : model2.smol ./source/*
	smoldyn model2.smol
./results/model4-pbcd.result ./results/model4-mbcd.result : model4.smol ./source/*
	smoldyn model4.smol
./results/lowdif-pbcd.result ./results/lowdif-mbcd.result : lowdif.smol ./source/*
	smoldyn lowdif.smol
./results/highdif-pbcd.result ./results/highdif-mbcd.result : highdif.smol ./source/*
	smoldyn highdif.smol
./results/lowdifs-pbcd.result ./results/lowdifs-mbcd.result : lowdifs.smol ./source/*
	smoldyn lowdifs.smol
./results/highdifs-pbcd.result ./results/highdifs-mbcd.result : highdifs.smol ./source/*
	smoldyn highdifs.smol

default.params highdif.params lowdif.params model4.params default.params lowdifs.params model1.params highdifs.params model2.params : ../experiments.csv ../generate_params.py
	cd ..; generate_params.py
