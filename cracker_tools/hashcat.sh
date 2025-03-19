#! /bin/bash

echo "*************** Look the magic happening ****************"

hashcat -m 1800 -a 0 hash.txt wordlist.txt