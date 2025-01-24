#!/bin/bash -l

#SBATCH --account=naiss2024-22-1518
#SBATCH --job-name="nf-var"
#SBATCH --output="nf-var.log"
#SBATCH --partition=shared
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=6-12:00:0

ml PDC/23.12
ml java/17.0.4
ml singularity
ml python/3.12.3

export NXF_OPTS='-Xms1g -Xmx4g'
export NXF_SINGULARITY_CACHEDIR=/cfs/klemming/projects/supr/nrmdnalab_storage/src/NXF_SINGULARITY_CACHEDIR

nextflow run \
    /cfs/klemming/projects/supr/nrmdnalab_storage/src/nf-var/main.nf \
    -name run_nf_var  \
    -profile pdc_kth \
    --project naiss2024-22-1518

