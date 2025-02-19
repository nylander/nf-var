#!/bin/bash -l

#SBATCH --account=naiss2024-22-1518
#SBATCH --job-name="nf-var"
#SBATCH --output="nf-var.log"
#SBATCH --partition=shared
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=1
#SBATCH --time=7-00:00:0

ml PDC/23.12
ml java/17.0.4
ml python/3.12.3
#ml singularity

export NXF_OPTS='-Xms1g -Xmx4g'
export NXF_CONDA_CACHEDIR=/cfs/klemming/projects/supr/nrmdnalab_storage/src/NXF_CONDA_CACHEDIR
#export NXF_SINGULARITY_CACHEDIR=/cfs/klemming/projects/supr/nrmdnalab_storage/src/NXF_SINGULARITY_CACHEDIR

cd /cfs/klemming/projects/supr/nrmdnalab_storage/src/nf-var
nextflow run \
    ./main.nf \
    -with-conda \
    -name run_nf_var \
    -work-dir $SNIC_TMP/run_nf_var/work \
    -profile pdc_kth \
    --project naiss2024-22-1518
