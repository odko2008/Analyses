#!/bin/bash
#$-M username@mail.com
#$-S /bin/bash
#$-N Test_raxml
#$-o /mnt/YourDirectory/raxml.out
#$-l mf=10000M
#$-l march=x86_64
cd /mnt/YourDirectory/raxml/
. /etc/profile
/mnt/YourDirectory/raxml/standard-RAxML-master/raxmlHPC-SSE3 -N 10 -m GTRGAMMAX -p 12345 -x 12345 -#100 -s myfile.fasta -n raxml_2023_v1.tre -p 1019778819 pause
