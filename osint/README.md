# Osint Write Up

### (Wappalyzer)[https://www.wappalyzer.com/] 


#### WhatWeb

```bash
whatweb -a3 https://www.facebook.com -v
```

#### WafW00f

```bash
sudo apt install wafw00f -y
wafw00f -v $TARGET
```

#### (Aquatone)[https://github.com/michenriksen/aquatone]

```bash
sudo apt install golang chromium-driver
go get github.com/michenriksen/aquatone
export PATH="$PATH":"$HOME/go/bin"

// help
aquatone --help
// example
cat facebook_aquatone.txt | aquatone -out ./aquatone -screenshot-timeout 1000
```


#### ZoneTransfer Manual Approach
```bash
// 1. Identify Nameservers
nslookup -type=NS zonetransfer.me

// 2. Testing for ANY and AXFR Zone Transfer
nslookup -type=any -query=AXFR zonetransfer.me nsztm1.digi.ninja
```

