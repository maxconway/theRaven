#!/usr/bin/python
import sys

##args:
#name
#modelname

with open('../fly-template', 'rb') as templatefile:
	template = templatefile.read()
	with open('./'+sys.argv[1], 'rb') as paramsfile:
		params = paramsfile.read()
		with open('./'+sys.argv[2],'wb') as output:
			result = template.replace('RePlAcEmE',params,1)
			output.write(result)
			
			


