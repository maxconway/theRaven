#!/usr/bin/python
import sys
import glob

##args:
#name

with open('../fly-template', 'rb') as templatefile:
	template = templatefile.read()
	for filename in glob.glob('./*.params'):
		with open(filename, 'rb') as paramsfile:
			params = paramsfile.read()
			with open(str.replace(filename,'.params','.smol'),'wb') as output:
				result = template.replace('RePlAcEmE',params,1)
				output.write(result)
			
			


