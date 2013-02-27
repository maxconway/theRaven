#!/usr/bin/python
import csv

with open('experiments.csv', 'rb') as csvfile:
	reader = csv.DictReader(csvfile,delimiter='	')
	for row in reader:
		with open('./experiments/'+row['name']+'.params','w') as output:
			output.write('define_global	'+'params'+'	'+row['name']+'.params'+'\n')
			for (k, v) in row.items():
				output.write('define_global	'+k+'	'+v+'\n')
