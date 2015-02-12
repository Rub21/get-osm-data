# processing-osm-history

Allows to create a file of OSM from each user on data-team.

### How to install:

`git clone https://github.com/Rub21/processing-osm-history.git`

`cd processing-osm-history`

In necessary to install

- [Curl](http://curl.haxx.se/download.html)

on directory `processing-osm-history`

- [Osmfilter](http://wiki.openstreetmap.org/wiki/Osmfilter)

- [Osmconvert](http://wiki.openstreetmap.org/wiki/Osmconvert)

### How to Execute

Get file from : http://planet.osm.org/replication/day/000/000/

`./editions.sh http://planet.osm.org/replication/day/000/000/882.osc.gz`

### Get a zip file

You will get the file named `edition-team.zip` in the directory processing-osm-history