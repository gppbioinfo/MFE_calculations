#------------------------
#cel-miR-2217a-5p|cel-miR-2217-5p/cel-miR-2217a-3p|cel-miR-2217-3p*	24	22	23	21	2,23	1,21
#CAGAGUGGGCAGUCGGUGUCGAUC&UGGCUUUGUCCGUGUUCCCAGCU
#.(((.(((((...((.(((((.&)))))))...)))))..))).   2,23  :   1,21  (-18.80)
#.(((.-(((((...((.(((((.
#||||| |||||||||| ||||| 
#.(((..(((((...((-(((((-

#CAGAGUGGGCAGUCGGUGUCGAUC
#UGGCUUUGUCCGUGUUCCCAGCU
#------------------------


open(GP,$ARGV[0]) || die;
while($line=<GP>)
{
chomp($line);
#if($line =~/miR|lsy|let|lin/)
if($line =~/cel/)
{
	$next=<GP>;$next1=<GP>;$next2=<GP>;$next3=<GP>;$next4=<GP>;$next5=<GP>;$next6=<GP>;$next7=<GP>;
	chomp($next);chomp($next1);chomp($next2);chomp($next3);chomp($next4);chomp($next5);chomp($next6);chomp($next7);
	#print "$next2\n$next4\n";
	@ku = split("",$next2);
	@kd = split("",$next4);
	@ld = split("\\/",$line);
	@ldd = split("\t",$ld[1]); 
	@npu = split(" ", $next1);
	
	
#$~="AllmiR";
#write;
	
	##upper arm 5' 4 nt
	#printf ("%s\t%s\t",$ld[0],$ldd[0]);
	#printf("%s\n\t\t\t\t\t\t\t\t\t%s\n\t\t\t\t\t\t\t\t\t%s", $next2, $next3,$next4);
#format AllmiR =
#@*	@*
#$ld[0], $ldd[0]	
#		@*
#		$next2	
#		@*
#		$next3
#		@*
#		$next4
#.
	print "$ld[0]\t$ldd[0]\t$next\t$next2**$next3**$next4\t$npu[4]$npu[5]\t";
	
	if($ku[0] eq "-" || $ku[1] eq "-" || $ku[2] eq "-" || $ku[3] eq "-" || $ku[4] eq "-")
	{
		#print "$next2\n";
		$up =  substr $next2, 1,4;
		$pur = rindex($up, "-");
		$pul = index($up, "-");
		
		if(($pur+1) > 0 && ($pul+1) >0)
		{
		$sup =  substr $next6, 0,4;
		#$nt = substr 
		$upp = substr $sup, $pur, 1, "-";
		$upp = substr $sup, $pul, 1, "-";
		#print "";
		#print "Upper First\t$ld[0]\t$next2\t$up\t$next6\t$sup\t$pur\t$pul\n";
		print "$sup\t";
		} else
		{
			$sup1 =  substr $next6, 0,4;
			#print "Upper First\t$ld[0]\t$next2\t$up\t$next6\t$sup1\t$pur\t$pul\n";
			print "$sup1\t";
		}		
		
	} else {
		$up =  substr $next2, 0,4;
		$sup =  substr $next6, 0,4;
		#print "Upper Sixth\t$ld[0]\t$next2\t$up\t$next6\t$sup\t$pur\t$pul\n";
		print "$sup\t";
	}
	
	#lower arm 5' 4 nt
	
	if($kd[0] eq "-" || $kd[1] eq "-" || $kd[2] eq "-" || $kd[3] eq "-" || $kd[4] eq "-")
	{
		#print "$kd[0]\t$kd[1]\n";
		$up =  substr $next4, 0,4;
		$pur = rindex($up, "-");
		$pul = index($up, "-");
		
		if(($pur+1) > 0 && ($pul+1) >0)
		{
		$sup =  substr $next7, 2,4;
		#$nt = substr 
		$upp = substr $sup, $pur, 1, "-";
		$upp = substr $sup, $pul, 1, "-";
		#print "--Lower First\t$ld[0]\t$next4\t$up\t$next7\t$sup\t$pur\t$pul\n";
		print "$sup\t";
		} 
		else
		{
			$sup1 =  substr $next7, 2,4;
			#print "**Lower First\t$ld[0]\t$next4\t$up\t$next7\t$sup1\t$pur\t$pul\n";
			print "$sup1\t";
		}
				
		
	} 
	else {
		if($ku[0] eq "-")
		{
		$up =  substr $next4, 0,4;
		$sup =  substr $next7, 3,4;
		#print "^^Lower Sixth\t$ld[0]\t$next4\t$up\t$next7\t$sup\t$pur\t$pul\n";
		print "$sup\t";
		} else
		{
		$up =  substr $next4, 0,4;
		$sup =  substr $next7, 2,4;
		#print "##Lower Sixth\t$ld[0]\t$next4\t$up\t$next7\t$sup\t$pur\t$pul\n";
		print "$sup\t";
		}
	}
	
	
	
	########### 3' end of uper arm
	
	if($ku[$#ku] eq "-" || ($ku[$#ku-1]) eq "-" || ($ku[$#ku-2]) eq "-" || ($ku[$#ku-3]) eq "-") {
		#$ot = substr $next2, -4; 
		#print "$ot\t$ku[$#ku]\t$ku[$#ku-1]\t$ku[$#ku-2]\t$ku[$#ku-3]\t$ku[$#ku-4]\n";
		$supp =  substr $next6, 0, -2;
		$ttt= substr $supp, -4;
		#print "$next6\t$supp\t$ttt\n";
		
		$up =  substr $next2, -4;
		$pur = rindex($up, "-");
		$pul = index($up, "-");
		
		if(($pur+1) > 0 && ($pul+1) >0 && ($pul+1) < 4 && ($pur+1) < 4)
		{
		$sup =  substr $supp, -4;
		#$nt = substr 
		$upp = substr $sup, $pur, 1, "-";
		$upp = substr $sup, $pul, 1, "-";
		print "$sup\t";
		#print "++Upper 3' First\t$ld[0]\t$next2\t$up\t$next6\t$sup\t$pur\t$pul\n";
		} else
		{
			$sup1 =  substr $supp, -4;
			#print "**Upper 3' First\t$ld[0]\t$next2\t$up\t$next6\t$sup1\t$pur\t$pul\n";
			print "$sup1\t";
		}		
		
	} 
	else {
	$supp =  substr $next6, 0, -2;
		if($kd[$#kd] eq "-")
		{
		##print "$next4\t$#kd\t$kd[$#kd]\n";
		$up =  substr $next2, -4;
		$pur = rindex($up, "-");
		$pul = index($up, "-");
		$supt =  substr $supp, 0,-1;
		$sup = substr $supp, -4;
		#print "^^First 3' Sixth\t$ld[0]\t$next2&$next4\t$up\t$next6\t$sup\t$pur\t$pul\n";
		print "$sup\t";
		} else
		{
		$up =  substr $next2, -4;
		$sup =  substr $supp,-4;
		#print "##First 3' Sixth\t$ld[0]\t$next2\t$up\t$next6\t$sup\t$pur\t$pul\n";
		print "$sup\t";
		}
	}
	
	########### 3' end of lower arm
	
	
	
	
	if($kd[$#kd] eq "-" || ($kd[$#kd-1]) eq "-" || ($kd[$#kd-2]) eq "-" || ($kd[$#kd-3]) eq "-") {
		#$ot = substr $next2, -4; 
		#print "$ot\t$kd[$#kd]\t$kd[$#kd-1]\t$kd[$#kd-2]\t$kd[$#kd-3]\t$kd[$#kd-4]\n";
		#$supp =  substr $next7, 0, -2;
		$ttt= substr $next7, -4;
		#print "$next6\t$supp\t$ttt\n";
		
		$up =  substr $next4, -4;
		$pur = rindex($up, "-");
		$pul = index($up, "-");
		
		if(($pur+1) > 0 && ($pul+1) >0 && ($pul+1) < 4 && ($pur+1) < 4)
		{
		$sup =  substr $next7, -4;
		#$nt = substr 
		$upp = substr $sup, $pur, 1, "-";
		$upp = substr $sup, $pul, 1, "-";
		#print "++Upper 3' First\t$ldd[0]\t$next4\t$up\t$next7\t$sup\t$pur\t$pul\n";
		print "$sup\t";
		} else
		{
			$sup1 =  substr $next7, -4;
			#print "**Upper 3' First\t$ldd[0]\t$next4\t$up\t$next7\t$sup1\t$pur\t$pul\n";
			print "$sup1\t";
		}		
		
	} 
	else {
	#$supp =  substr $next7, 0, ;
		#if($kd[$#kd] eq "-")
		#{
		#print "$next4\t$#kd\t$kd[$#kd]\n";
		#$up =  substr $next4, -4;
		#$pur = rindex($up, "-");
		#$pul = index($up, "-");
		#$supt =  substr $supp, 0,-1;
		#$sup = substr $supp, -4;
		#print "^^First 3' Sixth\t$ld[0]\t$next2&$next4\t$up\t$next6\t$sup\t$pur\t$pul\n";
		#} else
		#{
		$up =  substr $next4, -4;
		$sup =  substr $next7, -4;
		#print "##First 3' Sixth\t$ldd[0]\t$next4\t$up\t$next7\t$sup\t$pur\t$pul\n";
		print "$sup\t";
		#}
	}
	
print "\n";
	

}	
}

