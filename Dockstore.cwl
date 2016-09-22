#!/usr/bin/env cwl-runner

class: CommandLineTool
id: BD2KBDDS_Picard
label: BD2KBDDS_Picard tool
cwlVersion: latest

dct:creator:
  foaf:name: Pooja Vade
  foaf:mbox: pooja043@uw.edu

requirements:
- class: DockerRequirement
  dockerPull: quay.io/poojavade/bd2kbdds_picard:latest
  
hints:
- class: ResourceRequirement
  coresMin: 1
  ramMin: 4092
  outdirMin: 512000
  description: the process requires at least 4G of RAM

inputs:
  bam_input
    type: File
    format: "http://edamontology.org/format_2572"
    inputBinding:
      position: 1
    doc: The BAM file used as input, it must be sorted.

outputs:
  picardMarkDuplicates_report
    type: File
    format: http://edamontology.org/format_2572
    outputBinding:
      glob: Dupes_Marked
    doc: A bam file with duplicates marked
    
baseCommand: [bash, java]
