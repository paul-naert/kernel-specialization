import sys
from shutil import copyfile

trimmed_list=sys.argv[1]
copyfile(trimmed_list, "previous.list")


fout=open(trimmed_list,"w+")
flist=open("previous.list","r")
l=flist.readline()
count = 0
exclude = sys.argv[2]
while l:
    if not exclude in l:
        fout.write(l)
    else:
        count+=1
    l=flist.readline()

print count
fout.close()
flist.close()
