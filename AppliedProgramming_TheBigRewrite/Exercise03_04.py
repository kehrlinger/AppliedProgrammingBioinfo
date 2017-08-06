# Rewrite03_04

import subprocess

command = 'dir C:\\Users\\User\\PycharmProjects\\AppliedProgramming07\\ex3_data'



process = subprocess.Popen(command,
                           shell = True,
                           stdout = subprocess.PIPE,
                           stderr = subprocess.PIPE)

output = []
for line in process.stdout:
    line = line.decode('utf-8')
    output.append(line)

output = output[5:-2] #get rid of all the unnecessary lines
#print (output)
columnes = []
for line in output:
    columnes.append(line.split())
print(columnes)

for item in output:
    for element in item:
        if 'gene' in element:
            print (element)

#Note: To issue legacy OS commands correctly, double backslashes have to be used, otherwise they are interpreted as ??
#Note: To pass arguments to the subprocess module in different args (['dir', 'C:'] instead of [cmd] with 'cmd' being the command)
#       they need to be enclosed in brackets. Otherwise they will be interpreted as bufsize.
#
#Questions: Why 'shell = True'?