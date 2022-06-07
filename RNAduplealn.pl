open(GP, $ARGV[0]) || die;
while($line=<GP>)
{
chomp($line);
@aa = split("\t", $line);
$tprev = reverse($aa[7]);
$tprevcom = $tprev;
$tprevcom =~ tr/AUCG/UAGC/;
#print "$aa[7]\t$tprevcom\n";

open(FP, ">five.txt") || die;
print FP "$aa[3]\n";
close(FP);

open(FP1, ">five.fa") || die;
print FP1 ">$aa[0]|$aa[1]\n$aa[3]\n";
close(FP1);

open(TP, ">three.txt") || die;
print TP "$aa[7]\n";
close(TP);

open(TPF, ">three.fa") || die;
print TPF ">$aa[4]|$aa[5]\n$aa[7]\n";
close(TPF);

open(TP2, ">threerev.txt") || die;
print TP2 "$tprev\n";
close(TP2);

open(TP1, ">threerev.fa") || die;
print TP1 ">$aa[4]|$aa[5]\n$tprev\n";
close(TP1);

$st=`cat five.txt three.txt | RNAduplex | sed '/^\$/d'`;
#$st1=`cat five.txt threerev.txt | RNAduplex | sed '/^\$/d'`;

#`stretcher -asequence five.fa -bsequence three.fa -gapopen 15 -gapextend 5 -outfile $aa[0]_stretcherout`;
chomp($st); chomp($st);
@bb = split("\\&",$st);
@cc = split(" ",$bb[1]);

@ft = split(",",$cc[1]);
@kt = split(",",$cc[3]);

$lt = $ft[1]-4;
$mt = $kt[1]-4;

$fp4ntup = substr($aa[3], $ft[0], 4);
$fp4ntdw = substr($tprev, $kt[0], 4);

$tp4ntup = substr($aa[3], $lt, 4);
$tp4ntdw = substr($tprev, $mt, 4);

print "------------------------\n";
print "$aa[0]|$aa[1]/$aa[4]|$aa[5]\t".length($aa[3])."\t".length($bb[0])."\t".length($aa[7])."\t".length($cc[0])."\t$cc[1]\t$cc[3]\n";
print "$aa[3]&$tprev\n";
print "$st\n";
$cc[0] =~s/\)/\(/g;
$cc[0]=reverse($cc[0]);
@uparm = split("",$bb[0]);
@dwarm = split("",$cc[0]);

$aln=`python alnBio.py "$bb[0]" "$cc[0]" | head -3 `;

#$alnseq=`python alnBio.py "$aa[3]" "$tprevcom" | head -3`;

chomp($aln);
print "$aln\n";

chomp($alnseq);
print "$alnseq\n";


print "$aa[3]\n$tprev\n";
#$alnment = `cat $aa[0]_stretcherout`;
#print "$alnment";
#
#print "$st\n$st1\n";

#print "$fp4ntup\n$fp4ntdw\n\n$tp4ntup\n$tp4ntdw\n";
print "------------------------\n\n";
}
