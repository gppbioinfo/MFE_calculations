#!/bin/sh

########################################
# Please provide input file with two columns in which first column for 5p and 3p in the second from the miRNA duplex sequence.
# MFEcalc.sh input_file outfile
# test inputfile is provided with code
# It's required pairwise2 python package (pip/pip3 install pairwise2)
########################################

#Taking input from the terminal and define inputfile and outfile
    
inputfile=$1
outfile=`echo $1 | sed 's/\..*//'`;

echo ${inputfile} ${outfile}
printf "Started\n"

# provide inputfile and it will give the RNAduplex structure and final notation alignment for next step
perl RNAduplealn.pl ${inputfile} > ${outfile}\_step1.out.txt

# Arrange the dot-bracket notations and fill the gaps, trim 4nt from each end
perl 4nt.pl ${outfile}\_step1.out.txt > ${outfile}\_step2.out.txt
 
# Run RNAduplex on 4nt pairs for both ends and calculate each end MFE
perl MFE4nt.pl ${outfile}\_step2.out.txt > ${outfile}\_finalMFE4bp.out.txt

# Remove temperory files (Please avoid to rename inputfile as five/three...)
rm three*.* five*.*
printf "Output is generated in "${outfile}\_finalMFE4bp.out.txt"\n\n"

