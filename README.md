elife-flickr
============

An adaption of my workflow for BMC journals https://github.com/rossmounce/Trying-beautiful-soup  

eLife figure numbering is *really* annoying. Can't simply iterate (which works fine for PeerJ & BMC journals). 
I think the strange sub-figures are the problem. Pull requests to fix that would be greatfully appreciated ;)
Need to fix that at some point if I'm to embed the correct caption in the correct figure image.

# Running it

* I have run this on Lubuntu 14.04, YMMV on other untested platforms
* Run bash create_subfolders.sh first to create a subfolder for each html file (I would do this in the python script if I knew how!)
* Iterate over each html file, applying the beautiful soup python script to each:
* I know far more bash than I do python, but I'm sure it's possible to refactor more cleanly to a pure python solution
```
bash create_subfolders-elife.sh ;
for i in *.html ; do python elife-get-figures.py $i ; done ;
bash download-figs.sh ;
bash remove-apos.sh ; #Removes all apostrophes from all caption plaintext files, could actually learn how to escape them I guess
bash exif-CCBY-elife.sh ; #embeds constant strings : eLife & CC BY 
bash embedxmp.sh ; # this script calls on "doexif.sh" so make sure it's executable
```

bash create_subfolders can be happily re-run without losing what has been done in the next two lines
