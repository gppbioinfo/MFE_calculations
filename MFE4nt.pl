
print "miR_5p\tmiR_3p\tmiR_duplex_seq\tRNAduplex_secondary_structure_alignment\tMFE_RSS\t5\' 4nt (upper arm)\t3\' 4nt (lower arm)\t3\' 4nt (upper arm)\t5\' 4nt (lower arm)\tPair_1 MFE\tPair_2 MFE\tMFE_difference\n";
open(GP, $ARGV[0]) || die;
while($line=<GP>)
{
chomp($line);
@aa = split("\t",$line);

open(GTF, ">five4nt.fa");
print GTF "$aa[5]\n$aa[6]";
close(GTF);

open(GTT, ">three4nt.fa");
print GTT "$aa[7]\n$aa[8]";
close(GTT);

$fiveD=`RNAduplex < five4nt.fa | awk -F\"  \" '{print \$5}' | sed 's/)//; s/( //; s/(//; s/ //g'`;
$threeD=`RNAduplex < three4nt.fa | awk -F\"  \" '{print \$5}' | sed 's/)//; s/( //; s/(//; s/ //g'`;
chomp($fiveD);chomp($threeD);
$fiveD=~s/\s+//;
$threeD=~s/\s+//;

$line=~s/\t$//;

# guide::star check
if($a[0] = ~/\*/) {

$MFE_difference =  $threeD - $fiveD;
print "$line\t$fiveD\t$threeD\t$MFE_difference\n";
} elsif($a[1] = ~/\*/) {
$MFE_difference =  $fiveD - $threeD;
print "$line\t$fiveD\t$threeD\t$MFE_difference\n";
}

}
