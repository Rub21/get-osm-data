#!/bin/bash
name=$1
bzip2 -d $1
./osmconvert $name.osm > $name.05m
users=(Rub21 ediyes RichRico Luis36995 dannykath andygol shravan91 ruthmaben abel801 samely calfarome srividya_c PlaneMad)
for i in ${users[*]}
do
    ./osmfilter $name.osc --keep="@user=$i" -o=$i.osm
done
rm $name.05m
echo rm $name.osm
s=".osm "
r="$( printf "${s}%s" "${users[@]}" )"
r="${r:${#s}}"
zip -r edition-team.zip ${r}.osm
