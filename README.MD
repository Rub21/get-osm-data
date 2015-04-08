# processing-osm-history

Allows to create a file of OSM from each osm user.

`git clone https://github.com/Rub21/processing-osm-history.git`

`cd processing-osm-history`

**Dependencias:**

- [Curl](http://curl.haxx.se/download.html)


on directory `processing-osm-history`


- [Osmfilter](http://wiki.openstreetmap.org/wiki/Osmfilter)

- [Osmconvert](http://wiki.openstreetmap.org/wiki/Osmconvert)


### How to Execute

Get file from : http://planet.osm.org/replication/day/000/000/

**Crea un archivo por usuario, usuando la url**

`./editions-url.sh http://planet.osm.org/replication/day/000/000/882.osc.gz`

**Crea un archivo por usuario, por cada dia y lo comprime en un zip file**

`./editions_per_user.sh 931 938`

**Crea un solo archivo de todos los usuarios, por cada dia**

`./editions_all_users.sh 931 938`