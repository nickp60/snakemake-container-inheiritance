container: "docker://condaforge/mambaforge:4.12.0-0"

module sort:
    snakefile:
        "rules/sort.smk"

use rule * from sort as sort_*

module coverage:
    snakefile:
        "rules/coverage.smk"

use rule * from coverage as coverage_*

rule all:
    input:
        "test.sort.bam",
        "test.sort.mpileup",
    default_target: True
