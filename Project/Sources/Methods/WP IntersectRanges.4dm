//%attributes = {"invisible":true}
C_OBJECT:C1216($1;$range1)  // range of any kind
C_OBJECT:C1216($2;$range2)  // range of any kind

C_OBJECT:C1216($0;$range0)  // range of same kind if both similar, otherwise type char

C_LONGINT:C283($start;$end)

$range1:=$1
$range2:=$2

If ($range1.start>$range2.start)
	$start:=$range1.start
Else 
	$start:=$range2.start
End if 

If ($range1.end<$range2.end)
	$end:=$range1.end
Else 
	$end:=$range2.end
End if 

$range0:=WP Text range:C1341($range1.owner;$start;$end)


