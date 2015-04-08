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
    ./osmfilter $i.osc --keep="@user=Rub21 or @user=ediyes or @user=Luis36995 or @user=RichRico or @user=dannykath or @user=andygol or @user=shravan91 or @user=ruthmaben or @user=abel801 or @user=calfarome or @user=samely or @user=srivya_c or @user=PlaneMad" -o=process-$i.osm
	rm $i.osc
done
s=".osm "
r="$( printf "${s}%s" "${users[@]}" )"
r="${r:${#s}}"
zip -r edition-team.zip ${r}.osm
