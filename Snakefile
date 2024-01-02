rule all:
    input: "outputs/C_elegans.tRNA"

rule tRNAscan:
    input: "resources/C_elegans.fa"
    output: "outputs/tRNA_scan_result.txt"
    shell: """tRNAscan-SE {input} -o {output} """

rule tRNAscan_stats:
    input:
        genome= "resources/C_elegans.fa"
    output:
        tRNA= "outputs/C_elegans.tRNA",
        stats= "outputs/C_elegans.stats"
    params:
        threads= 2
    conda:
        "env/env.yaml"
    script:
        "scripts/tRNAscan_stats.py"