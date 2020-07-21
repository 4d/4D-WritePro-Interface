//%attributes = {"invisible":true}
C_COLLECTION:C1488($1;$_actions)  // automatic actions to test
C_BOOLEAN:C305($0;$result)  // returns true if at least one action is available)
C_TEXT:C284($action)
C_OBJECT:C1216($status)

$_actions:=$1
$result:=False:C215
For each ($action;$_actions) Until ($result=True:C214)  // exit as soon as one action is available
	$status:=Get action info:C1442($action;ak main form:K76:69)
	$result:=$result | ($status.enabled)
End for each 

$0:=$result
