# Helper scripts

### 1) merge_lanes_SE.pl

This script serves to merge separate fastq files produced from the separate lanes.
The lane specific fastq files have to have the following structure: **<sample_name>_L00<digit>_R1_001.fastq.gz**
These files have to be single-end and gzipped. The script is using *zcat* to merge the files.
The script takes standard out from *ls -l* as input and prints out merge commands.

```

ls -l <fastq_directory> | awk '{print $9}' | merge_lanes_SE.pl


```
 
  
