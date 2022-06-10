import sys
from Bio import SeqIO

f = sys.argv[1]
print ("name","position","mutation","reference_base")
seq_records = SeqIO.parse(f, 'fasta')
refseq_record = next(seq_records)
for seq_record in seq_records:
    for i in range(0, len(refseq_record)):
        nt1 = refseq_record[i]
        nt2 = seq_record[i]
        if nt1 != nt2:
            print (seq_record.id, i+1, nt2, nt1)

