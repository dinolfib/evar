# evar
variants calling pipeline by de novo assembly


Create Makefile.config in your working directory with the following template
```
REF = ref.fa
REF_GFF = ref.gff

SGA_PREPROC_FLAGS:= -r AGATCGGAAGAGCACACGTCTGAACTCCAGTC -c AGATCGGAAGAGCGTCGTGTAGGGAAAGAGTG
SGA_FILTER_FLAGS:= -x15 -k61
SGA_FMMERGE_FLAGS:= -m61
SGA_KMERCOUNT_FLAGS:= -k61
SGA_THREAD:= -t4
SGA_OVERLAP_FLAGS:= -m61
```

```
docker run --rm -v $(pwd):/export benjamindn/evar-call fastq.all
```





- no N in the ref
