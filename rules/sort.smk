sample = "test"

rule all:
    input:
        f"{sample}.sort.bam"

rule get_data:
    output:
        "test.bam"
    shell:
        "wget https://figshare.com/ndownloader/files/2133244 && mv 2133244 test.bam"

rule sort:
    input:
        bam="{sample}.bam",
    output:
        bam="{sample}.sort.bam",
    log:
        "logs/samtools/{sample}.log",
    threads: 8
    conda:
        "../envs/samtools.yaml"
    shell:
        """
        samtools sort {input.bam} -o {output.bam}
        """
