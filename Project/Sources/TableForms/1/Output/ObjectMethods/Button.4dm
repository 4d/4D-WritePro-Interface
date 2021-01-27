C_TEXT:C284($val)
$val:=Request:C163("word?")
If (ok=1) & ($val#"")
	QUERY BY ATTRIBUTE:C1331([SAMPLE:1]; [SAMPLE:1]WP:2; "_keywords[]"; =; $val)
End if 


