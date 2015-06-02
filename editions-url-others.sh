#!/bin/bash
url=$1
curl -O $url
length=$(expr ${#url} - 10)
name=${url:$length:3}
gzip -d $name.osc.gz
./osmconvert $name.osc > $name.05m
users=(anithakumari anthony1 anushap Apreethi arjun sekhar Ashok09 Bhanu bindhu harisha harishkonda himabindhu himalay jasvinderkaur kushwanth LakshmiC maheshrkm nagaraju Naresh08 Navaneetha Nikhil04 Pallavi pavankalyanreddy pawankumard pravalika01 praveeng premkumar pvprasad rajashekar rajeshvaaari Raju saberkhan saikumar saikumard sampathreddy sdivya shaheenbegum shalinins shashi1 shekarn shiva05 Smallikarjuna sowjanyaaa Srikanth07 thrinath Tinkle udaykanth vamshikrishna venkatesh10 vudemraju Yadhi06)
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
