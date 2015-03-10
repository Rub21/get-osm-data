#!/bin/bash
name=$1
#bzip2 -d $name
#./osmfilter $name -o=osm.o5m
users=(Rub21 ediyes RichRico Luis36995 dannykath andygol shravan91 ruthmaben abel801 samely calfarome srividya_c PlaneMad)
for i in ${users[*]}
do
    ./osmfilter $name --keep="@user=$i" -o=$i.osm
done
echo rm $name.05m
echo rm $name.osm
s=".osm "
r="$( printf "${s}%s" "${users[@]}" )"
r="${r:${#s}}"
zip -r edition-team.zip ${r}.osm

#./osmfilter changesets-latest.osm --keep="@user=Rub21 or @user=ediyes or @user=Luis36995 or @user=RichRico or @user=dannykath or @user=andygol or @user=shravan91 or @user=ruthmaben or @user=abel801 or @user=calfarome or @user=samely or @user=srivya_c or @user=PlaneMad" -o=osm.osm