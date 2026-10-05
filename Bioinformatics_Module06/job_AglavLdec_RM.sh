#!/bin/bash

#SBATCH -J Agla-Ldec           						# Job name
#SBATCH -o Agla-Ldec.o%j       						# Name of stdout output file
#SBATCH -e Agla-Ldec.e%j       						# Name of stderr error file
#SBATCH -p RM          									# Queue (partition) name
#SBATCH -N 1               									# Total # of nodes 
#SBATCH -n 128              								# Total # of mpi tasks 
#SBATCH -t 1:00:00        								# Run time (hh:mm:ss)
#SBATCH --mail-user=<your@email.edu>		# email address
#SBATCH --mail-type=all    							# Send email at begin and end of job      

# Other commands must follow all #SBATCH directives...

module load BLAST

blastp -query Agla2.0_prot.faa -db Ldec2.0_prot.faa -outfmt "6 qseqid sseqid evalue" -max_target_seqs 1 -num_threads 128 -out Agla_query_v_Ldec_subject.txt
blastp -query Ldec2.0_prot.faa -db Agla2.0_prot.faa -outfmt "6 qseqid sseqid evalue" -max_target_seqs 1 -num_threads 128 -out Ldec_query_v_Agla_subject.txt