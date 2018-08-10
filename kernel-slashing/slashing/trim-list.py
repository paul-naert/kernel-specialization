import sys
from shutil import copyfile

copyfile("OCCAM/trimmed.list", "OCCAM/previous.list")


fout=open("OCCAM/trimmed.list","w+")
flist=open("OCCAM/previous.list","r")
l=flist.readline()
count = 0
exclude = sys.argv[1]
while l:
    if not exclude in l:
        fout.write(l)
    else:
        count+=1
    l=flist.readline()

print count
fout.close()
flist.close()