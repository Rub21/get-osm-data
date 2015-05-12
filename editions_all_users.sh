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
    ./osmfilter $i.osc --keep="@user=anithakumari or @user=anthony1 or @user=anushap or @user=Apreethi or @user=arjun or @user=sekhar or @user=Ashok09 or @user=Bhanu or @user=bindhu or @user=harisha or @user=harishkonda or @user=himabindhu or @user=himalay or @user=jasvinderkaur or @user=kushwanth or @user=LakshmiC or @user=maheshrkm or @user=nagaraju or @user=Naresh08 or @user=Navaneetha or @user=Nikhil04 or @user=Pallavi or @user=pavankalyanreddy or @user=pawankumard or @user=pravalika01 or @user=praveeng or @user=premkumar or @user=pvprasad or @user=rajashekar or @user=rajeshvaaari or @user=Raju or @user=saberkhan or @user=saikumar or @user=saikumard or @user=sampathreddy or @user=sdivya or @user=shaheenbegum or @user=shalinins or @user=shashi1 or @user=shekarn or @user=shiva05 or @user=Smallikarjuna or @user=sowjanyaaa or @user=Srikanth07 or @user=thrinath or @user=Tinkle or @user=udaykanth or @user=vamshikrishna or @user=venkatesh10 or @user=vudemraju or @user=Yadhi06" -o=process-$i.osm
	rm $i.osc
done
s=".osm "
r="$( printf "${s}%s" "${users[@]}" )"
r="${r:${#s}}"
zip -r edition-team.zip ${r}.osm
