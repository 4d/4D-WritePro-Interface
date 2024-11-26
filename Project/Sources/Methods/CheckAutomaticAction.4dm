//%attributes = {"invisible":true}
#DECLARE($_actions : Collection)->$result : Boolean

var $action : Text
var $status : Object

$result:=False:C215
For each ($action; $_actions) Until ($result=True:C214)  // exit as soon as one action is available
	$status:=Action info:C1442($action; ak main form:K76:69)
	$result:=$result | ($status.enabled)
End for each 
