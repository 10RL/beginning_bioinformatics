#!/bin/bash

#SBATCH -J Ldec-Tcas           						# Job name
#SBATCH -o Ldec-Tcas.o%j       					# Name of stdout output file
#SBATCH -e Ldec-Tcas.e%j       					# Name of stderr error file
#SBATCH -p RM          									# Queue (partition) name
#SBATCH -N 1               									# Total # of nodes 
#SBATCH -n 128              								# Total # of mpi tasks 
#SBATCH -t 1:00:00        								# Run time (hh:mm:ss)
#SBATCH --mail-user=<your@email.edu>		# email address
#SBATCH --mail-type=all    							# Send email at begin and end of job      

# Other commands must follow all #SBATCH directives...

module load BLAST

blastp -query Ldec2.0_prot.faa -db Tcas5.2_prot.faa -outfmt "6 qseqid sseqid evalue" -max_target_seqs 1 -num_threads 128 -out Ldec_query_v_Tcas_subject.txt
blastp -query Tcas5.2_prot.faa -db Ldec2.0_prot.faa -outfmt "6 qseqid sseqid evalue" -max_target_seqs 1 -num_threads 128 -out Tcas_query_v_Ldec_subject.txt