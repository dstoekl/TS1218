#! /usr/bin/python

import sys
import urllib2
import json
import os.path
from multiprocessing.dummy import Pool as ThreadPool 

def download_image(file_name_and_url_tuple):
    (file_name, image_url) = file_name_and_url_tuple
    if os.path.isfile(file_name):
        quit
    f = urllib2.urlopen(image_url)
    data = f.read()
    with open(file_name, "wb") as output_file:
        output_file.write(data)
    
# print sys.argv
if (len(sys.argv) < 2):
    print 'Usage: iiif-downloader.py manifest_url'
    sys.exit()

url = sys.argv[1]
images = []
response = urllib2.urlopen(url)
data = json.loads(response.read())
canvases = data['sequences'][0]['canvases']
for canvas in canvases:
    canvas_name = str(canvas['@id']).split('/')[-1].split('.')[0] + '.jpg'
    canvas_image = canvas['images'][0]['resource']['@id']
    images.append((canvas_name, canvas_image))

# Create a pool of workers, to speed the download
pool = ThreadPool(4) 

# Run the threaded download
results = pool.map(download_image, images)

# close the pool and wait for the work to finish 
pool.close() 
pool.join() 