#!/bin/bash
#$-M odko2008@yahoo.com
#$-S /bin/bash
#$-N Test_raxml
#$-o /mnt/lfs2/odko/bear_wgs/raxml.out
#$-l mf=10000M
#$-l march=x86_64
cd /mnt/lfs2/odko/bear_wgs/raxml/
. /etc/profile
/mnt/lfs2/odko/bear_wgs/raxml/standard-RAxML-master/raxmlHPC-SSE3 -N 10 -m GTRGAMMAX -s myfile.fasta -n raxml_2023_v1.tre -p 1019778819 pause
