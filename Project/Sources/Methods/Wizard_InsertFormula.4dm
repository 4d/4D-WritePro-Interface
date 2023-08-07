//%attributes = {}

#DECLARE($insert : Object)
var $range : Object

$range:=WP Selection range:C1340(*; $insert.areaName)
WP INSERT FORMULA:C1703($range; Formula from string:C1601($insert.source; 1); wk replace:K81:177)  // ∆∆∆ Feature 125

If (Shift down:C543)
	WP INSERT BREAK:C1413($range; wk paragraph break:K81:259; wk append:K81:179; wk include in range:K81:180)
Else 
	WP SET TEXT:C1574($range; " "; wk append:K81:179; wk include in range:K81:180)
End if 
WP SELECT:C1348(*; $insert.areaName; $range.end; $range.end)
