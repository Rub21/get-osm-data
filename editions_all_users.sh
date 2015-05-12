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
    ./osmfilter $i.osc --keep="@user=shashi1 or @user=Bhanu or @user=Nikhil04 or @user=shiva05 or @user=yadhi06 or @user=srikanth07 or @user=naresh08 or @user=ashok09 or @user=venkatesh10 or @user=maheshrkm or @user=udaykanth or @user=Pallavi or @user=PremKumar or @user=saberkhan or @user=saikumar or @user=thrinath or @user=pavankalyanreddy or @user=rajeshvaaari or @user=vamshikrishna or @user=himalay or @user=vudemraju or @user=anushap or @user=rajashekar or @user=sdivya or @user=pvprasad or @user=praveeng or @user=pawankumard or @user=jasvinderkaur or @user=bindhu or @user=himabindhu or @user=shekarn or @user=harisha or @user=sowjanyaaa or @user=anithakumari or @user=Navaneetha or @user=arjun or @user=sekhar or @user=Kushwanth or @user=shalinins or @user=apreethi or @user=anthony1 or @user=shaheenbegum or @user=smallikarjuna or @user=sampathreddy or @user=tinkle or @user=saikumard or @user=Harishkonda or @user=Pravalika01 or @user=Raju or @user=Nagaraju or @user=LakshmiC" -o=process-$i.osm
	rm $i.osc
done
s=".osm "
r="$( printf "${s}%s" "${users[@]}" )"
r="${r:${#s}}"
zip -r edition-team.zip ${r}.osm
