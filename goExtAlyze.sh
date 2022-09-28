#!/bin/zsh

while getopts i:o:z: flag
do
	case "${flag}" in
		i) ip=${OPTARG};;
		o) out=${OPTARG};;
		z) zip=${OPTARG};;
	esac
done

printf "\nEnter client name: "

read client

mkdir $client

printf "\n"

printf "\nStarting service discovery\n"

nmap --min-rate=150 --min-hostgroup=25 --max-retries=2 --initial-rtt-timeout=250ms --max-rtt-timeout=400ms --max-scan-delay=5 -Pn -sS -sV  -O -sU -p T:1-65535,U:53,67-69,111,123,135,137-139,161-162,445,500,514,520,623,631,996-999,1434,1701,1900,3283,4500,5353,49152-49154 -iL $ip -vv -oA ./$client/$out

while true; do
	printf "Do you want to run Gowitness? "
	read yn
	case $yn in
		[Yy]* ) printf "\nStarting screen grab";
			/home/parallels/go/bin/gowitness nmap --file ./$client/$out.xml --service http --service https -F;
			printf "\nGenerating web report";
			/home/parallels/go/bin/gowitness report export -f ./$client/$zip;
			unzip ./$client/$zip; break;;
		[Nn]* ) exit;;
		* ) echo "Need an answer big dawg.";;
	esac
done


