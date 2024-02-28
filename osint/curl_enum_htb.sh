#!/bin/bash

while IFS= read -r url; do
	echo "Url: $url"

	response=$(curl -s 10.129.172.17 -H "Host: $url.inlanefreight.htb")
	echo "$url.inlanefreight.htb"
	if [[ $response =~ HTB\{.*\} ]]; then
		echo "Pattern in response:"
		echo "$response" | grep -o 'HTB{.*}'
		echo ""
	else
		echo ""
fi
done < test.txt
