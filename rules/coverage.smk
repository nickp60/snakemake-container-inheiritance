container: "docker://condaforge/mambaforge:4.12.0-0"
#container: "docker://continuumio/miniconda3:4.4.10"

sample = "test"

rule all:
    input:
        f"{sample}.sort.mpileup"

rule cov:
    input:
        bam="{sample}.sort.bam",
    output:
        mp="{sample}.sort.mpileup",
    log:
        "logs/bedtools/{sample}.log",
    threads: 8
    conda:
        "../envs/samtools-old.yaml"
    shell:
        """
        samtools mpileup {input.bam} -o {output.mp}
        """
