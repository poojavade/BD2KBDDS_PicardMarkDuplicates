#!/usr/bin/env cwl-runner

class: CommandLineTool
id: BD2KBDDS_Picard
label: BD2KBDDS_Picard tool
cwlVersion: latest

description: "This is a BD2k-BDDS Picard container. Please have a look on https://broadinstitute.github.io/picard/ for more information."

dct:creator:
  foaf:name: Pooja Vade
  foaf:mbox: "mailto:pooja043@uw.edu"

requirements:
- class: DockerRequirement
  dockerPull: "quay.io/poojavade/bd2kbdds_picard:latest"

inputs:
  id: "#bam_input"
    type: File
    description: "The BAM file used as input, it must be sorted."
    format: "http://edamontology.org/format_2572"
    inputBinding:
      position: 1

outputs:
  - id: "#picardMarkDuplicates_report"
    type: File
    format: "http://edamontology.org/format_2572"
    outputBinding:
      glob: Dupes_Marked.bam
    description: "A bam file with duplicates marked."

baseCommand: [bash, java -jar $PICARD -h] 

