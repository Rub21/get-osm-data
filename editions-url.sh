#!/bin/bash
url=$1
curl -O $url
length=$(expr ${#url} - 10)
name=${url:$length:3}
gzip -d $name.osc.gz
./osmconvert $name.osc > $name.05m
users=(Rub21 ediyes RichRico Luis36995 dannykath andygol shravan91 ruthmaben abel801 samely calfarome srividya_c PlaneMad karitotp)
for i in ${users[*]}
do
    ./osmfilter $name.osc --keep="@user=$i" -o=$name-$i.osm
done
rm $name.05m
rm $name.osc
s=".osm "
r="$( printf "${s}%s" "${users[@]}" )"
r="${r:${#s}}"
zip -r edition-team.zip ${r}.osm
eval "java -Xmx1024M -DproxyHost=$PROXY -DproxyPort=8080 -jar josm.jar ${r}.osm"