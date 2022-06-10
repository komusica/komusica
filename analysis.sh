# Shell script to do the snp analysis. We have lot of sequences in fasta format of a clone. it has to be matched to a reference sequence and then the position of snp and which base is mutated to which need to be calculated.
echo "Enter the fasta file name"
read file
echo $file

#file='11107959100_Plate10_Run1.fasta'
seqkit stats -a $file >"${file}_stats.txt"

#filter file for sequneces smaller than 600 bases.
seqkit seq -m 600 -g $file >"${file}_filtered"


seqkit stats -a ${file}_filtered > "${file}_filtered_stats.txt"


# MAFFT
 #with clustal output
  mafft --thread 12 --inputorder --keeplength --clustalout --adjustdirection --maxambiguous 0.05 --add ${file}_filtered reference_sequence.fa > "maftt_clustal_${file}_filtered.output"
 
 # with fasta output 
   mafft --thread 12 --inputorder --keeplength --adjustdirection --maxambiguous 0.05 --add ${file}_filtered reference_sequence.fa > "maftt_fasta_${file}_filtered.output"

# finding snps

python finding_snps.py maftt_fasta_${file}_filtered.output > "snp_result_${file}_filtered.txt"




