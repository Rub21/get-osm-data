#!/bin/bash
url="http://planet.osm.org/replication/day/000/000/"
for i in $(seq $1 $2)
do	
	if (($i<10)); then
        curl ${url}00$i.osc.gz -o "$i.osc.gz"
    fi
    if (($i<100)) && (($i>=10)); then
        curl ${url}0$i.osc.gz -o "$i.osc.gz"
    fi
    if (($i>=100)); then
        curl $url$i.osc.gz -o "$i.osc.gz"
    fi
    gzip -d $i.osc.gz
    #./osmconvert $i.osc > $i.05m
    echo "Processing.. $i"
	users=(Rub21 ediyes RichRico Luis36995 dannykath andygol shravan91 ruthmaben abel801 samely calfarome srividya_c PlaneMad)
	for j in ${users[*]}
	do
	    ./osmfilter $i.osc --keep="@user=$i" -o=$i-$j.osm
	done
	#rm $i.05m
	rm $i.osc
done
s=".osm "
r="$( printf "${s}%s" "${users[@]}" )"
r="${r:${#s}}"
zip -r edition-team.zip ${r}.osm
