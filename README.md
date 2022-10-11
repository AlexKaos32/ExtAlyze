# ExtAlyze
Zsh script utilizing nmap and gowitness to enumerate targets. Must be run using sudo or as root.

Usage: sudo ./ExtAlyze.sh -i `/path/to/ip/file` -o `/name/for/output/file` -z `/zip/for/gowitness`

This script assumes that the gowitness binary is at `/home/parallels/go/bin/gowitness` so if it's somewhere else, update the gowitness path.
