
ferr=open("errlog")
flist=open("OCCAM/exclude.list","a")
undef=0
l=ferr.readline()
added=[]
while l:
    l_split=l.split(" ")
    if "undefined" in l_split:
        for word in l_split:
            if word[0]=="`":
                name=word.split("'")[0][1:]
                if name not in added:
                    flist.write(name+"\n")
                    added.append(name)
                    print name
        # undef=1
    l=ferr.readline()
ferr.close()
flist.close()