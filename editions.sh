#!/bin/bash
curl -O http://planet.openstreetmap.org/replication/day/000/000/$1.osc.gz
gzip -d $1.osc.gz
./osmconvert $1.osc > $1.05m
users=(Rub21 ediyes RichRico Luis36995 dannykath andygol shravan91 ruthmaben abel801 samely calfarome srividya_c PlaneMad)
for i in ${users[*]}
do
    ./osmfilter $1.osc --keep="@user=$i" -o=$i.osm
    echo $users
done
rm $1.05m
rm $1.osc
s=".osm "
r="$( printf "${s}%s" "${users[@]}" )"
r="${r:${#s}}"
eval "java -Xmx1024M -DproxyHost=$PROXY -DproxyPort=8080 -jar josm.jar ${r}.osm"