#!/bin/bash
url="http://planet.osm.org/replication/day/000/000/"
users=(Rub21 ediyes Luis36995 RichRico dannykath andygol shravan91 ruthmaben abel801 calfarome samely srividya_c PlaneMad karitotp Chetan_Gowda ramyaragupathy lxbarth shvrm geohacker)

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
    for j in ${users[*]}
    do
        ./osmfilter $i.osc --keep="@user=$j" -o=$i-$j.osm
    done
    zip $i.zip *.osm
    rm *.osm
    rm *.osc
done

