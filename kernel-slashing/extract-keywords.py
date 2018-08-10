import sys

flist=open(sys.argv[1],"r")
l=flist.readline()
count={}
while l:
    l_without_lf=l.split("\n")[0]
    l_split=l_without_lf.split("_")
    for word in l_split:
        if word in count:
            count[word]=count[word]+1
        else:
            count[word]=1
    l=flist.readline()
#print count
for key, value in sorted(count.iteritems(), key=lambda (k,v): (v,k)):
    print "%s: %s" % (key, value)
flist.close()