#!/usr/bin/python
from bs4 import BeautifulSoup
import sys
import getopt 
import os

soup = BeautifulSoup (open(sys.argv[1]))
figfig = soup.find_all('div', class_="fig-caption")
#print(figfig)

datadir = sys.argv[1]
chomped = datadir[:-5]
#IMGs
file = open("./"+chomped+"/"+chomped+"-imgs.txt", "wb")

for link in soup.find_all(class_="elife-figure-link elife-figure-link-newtab"):
        img = link.a.get('href').encode("utf8")
        #print(link.a.get('href')).encode("utf8") #print in terminal to verify results
        file.write("http://elifesciences.org"+img+'\n')

file.flush()
file.close()

datadir = sys.argv[1]
chomped = datadir[:-5]
#CAPTIONS
file = open("./"+chomped+"/"+chomped+"-caps.txt", "wb")

for dink in soup.find_all('div', class_="fig-caption"):
    #print(dink.get_text(separator=' '))
    cap = dink.get_text(separator=' ').replace('Download figure Open in new tab Download powerpoint ','').encode("utf8")
    file.write(str(cap)+'\n')

file.flush()
file.close()





