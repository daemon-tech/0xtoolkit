## Passive Subdomain Enumeration

```bash
export TARGET="facebook.com"
cat sources.txt | while read source; do theHarvester -d "${TARGET}" -b $source -f "${source}_${TARGET}";done


[*] Target: facebook.com

[*] Searching Urlscan.

[*] ASNS found: 29
--------------------
AS12578
AS13335
AS13535
AS136023
AS14061
AS14618
AS15169
AS15817

<SNIP>
```

extract all the subdomains found and sort them via the following command:
Passive Subdomain Enumeration

```bash
cat *.json | jq -r '.hosts[]' 2>/dev/null | cut -d':' -f 1 | sort -u > "${TARGET}_theHarvester.txt"
```

merge all the passive reconnaissance files via:
Passive Subdomain Enumeration

```bash
cat facebook.com_*.txt | sort -u > facebook.com_subdomains_passive.txt
cat facebook.com_subdomains_passive.txt | wc -l
``` 


11947


# Install/Start

```bash
$ ~ > git clone https://github.com/laramies/theHarvester 
$ ~ > cd theHarvester

$ ~ > python3 -m pip install -r requirements/base.txt

$ ~ > python3 theHarvester.py -h
```
