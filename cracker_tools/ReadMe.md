# Best Cracker tools
 * For **john ripper**:
        `john --format=crypt hash.txt --wordlist=word.txt`
    * Change the hash.txt with your txt file. If you haven't, don't worry follow this steps:
        1. find and copy the hash
        2. create file using `nano hash_container.txt`
        3. past the hash and enter *ctrl+s* to save then *ctrl+x* to close
    * Analyse the hash type it may be:
        * MD5 => $1$salt$hashed_value
        * SHA-256 => $5$salt$hashed_value
        * SHA-512 => $6$salt$hashed_value
        * yescrypt => $y$parameters$salt$hashed_value
        * OR use this tool `hash-identifier`
        * *Remember*: the above hash types are not pure hashes instead they are mixed with salts
    * Based on hash types look `man john` to identify the format for `--format==`
        eg: `--format==SHA-512`, `--format==crypt`
    * Creat wordlist using `crunch`
        eg: `crunch 4 4 1234567890 -o word.txt`,
            `crunch 8 8 -t A%%%@@^@ -o word.txt`
* For **hashcat**:
        `hashcat -m 1800 -a 0 hash.txt wordlist.txt`
    * Apply the above first 2 steps
    * Based on the hash types look `man hashcat` to identify the format for `-m `
        eg: `-m 1800` doesn't have mode for yescrypt
    * Select attack type using `-a `
        eg: `-a 3`
    * Apply the above for creating the wordlist
    * you can also apply patterns like 
       - `hashcat -m 1800 -a 0 hash.txt ?d?l?d?u` during this u specify a length also.
