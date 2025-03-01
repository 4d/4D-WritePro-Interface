//%attributes = {"invisible":true}

#DECLARE()->$result : Boolean

var $ok : Boolean

var $typeSelection : Integer

var oTempArea : Object
var userUnit : Text  //•
var numFormat : Text  //•
var unitName : Text  //•
var masterTable : Pointer  // 27 sept 2018 (was not used before ?)
var maxTabValue : Real

If (OB Is empty:C1297(oTempArea))
	oTempArea:=WP New:C1317
End if 

maxTabValue:=138  // inches (value will change if any other unit)

If (Form:C1466.skin#Null:C1517)
	oForm.skin:=Form:C1466.skin
	oForm.skinAppliedMain:=False:C215  // will force skin to apply again
	oForm.skinAppliedSub:=False:C215  // will force skin to apply again
End if 

If (Not:C34(Undefined:C82(Form:C1466.eventCode)))  //2023/01/25 by RL
	oForm.eventCode:=Form:C1466.eventCode
End if 

If (Form:C1466.selection#Null:C1517) && (Not:C34(Undefined:C82(Form:C1466.selection.owner)))  // second condition added by RL on 2024/07/16
	
	
	Form:C1466.document:=Form:C1466.selection.owner
	Form:C1466.body:=WP Get body:C1516(Form:C1466.document)
	$typeSelection:=Form:C1466.selection.type
	Case of 
			
		: ($typeSelection=0)
			
			Form:C1466.paragraphRange:=WP Paragraph range:C1346(Form:C1466.selection)
			Form:C1466.imageRange:=WP Picture range:C1347(Form:C1466.selection)
			
		: ($typeSelection=2)
			
			Form:C1466.paragraphRange:=New object:C1471
			Form:C1466.imageRange:=New object:C1471
			
		Else 
			
			ALERT:C41("Bug: Other selection type !")
			
	End case 
	
	Form:C1466.context:=WP Get data context:C1787(Form:C1466.document)
	
	
	WP Get attributes:C1345(Form:C1466.document; wk layout unit:K81:78; userUnit)
	
	//userUnit:=wk unit cm
	Case of 
		: (userUnit=wk unit cm:K81:135)
			
			unitName:="cm"
			numFormat:="######0.00"
			
		: (userUnit=wk unit mm:K81:171)
			
			unitName:="mm"
			numFormat:="######0"
			
		: (userUnit=wk unit px:K81:137)
			
			unitName:="px"
			numFormat:="######0"
			
		: (userUnit=wk unit inch:K81:172)
			
			unitName:="in"
			numFormat:="######0.00"
			
		: (userUnit=wk unit pt:K81:136)
			
			unitName:="pt"
			numFormat:="######0"
			
		Else 
			
			unitName:="pt"
			numFormat:="######0"
			
	End case 
	
	maxTabValue:=WP_Convert(10000; wk unit pt:K81:136; unitName)
	
	$ok:=True:C214
	
	
Else 
	Form:C1466.document:=Null:C1517
End if 


If (Form:C1466.zoneName#Null:C1517)  // old area code
	Form:C1466.areaName:=Form:C1466.zoneName
End if 

areaName:=Form:C1466.areaName

If (Form:C1466.masterTable#Null:C1517)
	masterTable:=Form:C1466.masterTable
End if 

$result:=$ok
