#!/bin/bash

# IP address to find the FQDN for
ip_to_find="" #Input ip

# File containing the list of DNS servers
dns_list_file="dns.txt" #input file

# Domain to query for zone transfer
domain="10.129.109.78"  # Change this to your domain

# Check if the DNS list file exists
if [ ! -f "$dns_list_file" ]; then
    echo "DNS list file '$dns_list_file' not found."
    exit 1
fi

# Iterate through each DNS server in the list
while IFS= read -r dns_server; do
    echo "Performing zone transfer for DNS server: $dns_server"

    # Perform zone transfer using dig
    dns_output=$(dig +nocmd @"$dns_server" "$domain" AXFR +multiline +nocomments +noquestion +nostats +nocmd 2>&1)

    # Check if zone transfer was successful
    if [[ "$dns_output" == *"transfer failed"* ]]; then
        echo "Zone transfer failed for DNS server: $dns_server"
        continue
    fi

    # Parse DNS records to find FQDN for the specified IP address
    fqdn=$(echo "$dns_output" | grep -E "\b$ip_to_find\b" | awk '{print $1}')

    # Check if FQDN was found
    if [ -n "$fqdn" ]; then
        echo "The FQDN for IP address $ip_to_find on DNS server $dns_server is: $fqdn"
        exit 0  # Exit successfully
    fi
done < "$dns_list_file"

# If the loop completes without finding a match, print a message
echo "No FQDN found for IP address $ip_to_find"
exit 1  # Exit with error status code

