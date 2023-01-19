//%attributes = {}

#DECLARE($action : Text; $formatType : Integer; $insert : Object)

var $visible : Boolean
var $range : Object
var $json : Text

//For ($i; 0; Form.selectFormat.length-1)
//Form.selectFormat[$i]:=0
//End for 
////OBJECT SET VISIBLE(*; "formatSample@"; False)

//Form.selectFormat[$formatType]:=1

//Form.local.formatSample:=""

Form:C1466.formats:=New collection:C1472

Case of 
	: ($action="init")
		
		Case of 
			: ($formatType=Is date:K8:7)
				Form:C1466.local.displayedFormats:=Form:C1466.local.dateFormats
				
			: ($formatType=Is time:K8:8)
				Form:C1466.local.displayedFormats:=Form:C1466.local.timeFormats
				
			: ($formatType=Is real:K8:4)
				Form:C1466.local.displayedFormats:=Form:C1466.local.numberFormats
				
			: ($formatType=Is text:K8:3)
				Form:C1466.local.displayedFormats:=Form:C1466.local.textFormats
				
			: ($formatType=Is picture:K8:10)
				Form:C1466.local.displayedFormats:=Form:C1466.local.pictureFormats
				
			: ($formatType=Is boolean:K8:9)
				Form:C1466.local.displayedFormats:=Form:C1466.local.booleanFormats
				
			: ($formatType=Is integer:K8:5)  // TIME OR NUMERIC for static contexts
				Form:C1466.local.displayedFormats:=Form:C1466.local.numberAndTimeFormats
				
		End case 
		
		Form:C1466.fullFormat:=Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index]
		
		UI_Formula("sample"; Form:C1466.local.displayedFormats.type)  // one level recursive
		
		
		
	: ($action="sample")
		
		OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; False:C215)
		OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; False:C215)
		
		
		Case of 
			: ($formatType=Is date:K8:7)
				Form:C1466.local.formatSample:=String:C10(Current date:C33; Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index])
				
			: ($formatType=Is time:K8:8)
				Form:C1466.local.formatSample:=String:C10(Current time:C178; Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index])
				
			: ($formatType=Is real:K8:4) | (($formatType=Is integer:K8:5) & (Value type:C1509(Form:C1466.fullFormat)=Is text:K8:3))
				
				If (Position:C15("%"; Form:C1466.fullFormat)>0)
					Form:C1466.local.formatSample:=String:C10(4.567; Form:C1466.fullFormat)
				Else 
					Form:C1466.local.formatSample:=String:C10(123456.789; Form:C1466.fullFormat)
				End if 
				
				OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; True:C214)
				
			: ($formatType=Is text:K8:3)
				
				Form:C1466.local.formatSample:=String:C10("ABCDEFGHIJKLMNOP"; Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index])
				
				OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; True:C214)
				
				
			: ($formatType=Is picture:K8:10)
				Form:C1466.local.formatSample:=""
				
			: ($formatType=Is boolean:K8:9)
				Form:C1466.local.formatSample:=""
				
				OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; True:C214)
				OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; True:C214)
				
			: ($formatType=Is integer:K8:5)  // must be a TIME; (static contexts). Numeric cases have been managed with "is real" above
				
				Form:C1466.local.formatSample:=String:C10(Current time:C178; Form:C1466.local.displayedFormats.apply4D[Form:C1466.local.displayedFormats.index])
				OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; False:C215)
				OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; False:C215)
				
		End case 
		
		
		UI_Formula("cleanup")  // one level recursive
		
	: ($action="cleanup")
		
		$visible:=(Form:C1466.formulaSource#"") && ((Form:C1466.local.type=Is real:K8:4) || (Form:C1466.local.type=Is integer:K8:5) || (Form:C1466.local.type=Is text:K8:3) || (Form:C1466.local.type=Is picture:K8:10) || (Form:C1466.local.type=Is date:K8:7) || (Form:C1466.local.type=Is time:K8:8) || (Form:C1466.local.type=Is boolean:K8:9))
		
		OBJECT SET VISIBLE:C603(*; "lbl_StandardFormat"; $visible)
		OBJECT SET VISIBLE:C603(*; "DD_formats"; $visible)
		
		
		Case of 
			: (Form:C1466.formulaSource#"") && ((Form:C1466.local.type=Is real:K8:4) || (Form:C1466.local.type=Is text:K8:3) || (Form:C1466.local.type=Is boolean:K8:9))
				
				$visible:=True:C214
				
			: (Form:C1466.formulaSource#"") && (Form:C1466.local.type=Is integer:K8:5)  // special case : interger means time OR numéric
				
				If (Value type:C1509(Form:C1466.fullFormat)=Is text:K8:3)  // format is text but value is a number
					$visible:=True:C214
				Else   // time
					$visible:=False:C215
				End if 
			Else 
				$visible:=False:C215
		End case 
		
		OBJECT SET VISIBLE:C603(*; "Input_fullFormat"; $visible)
		OBJECT SET VISIBLE:C603(*; "lbl_EditFormat"; $visible)
		
		
		OBJECT SET VISIBLE:C603(*; "btn_ClearFilter"; (Form:C1466.local.filter#""))
		OBJECT SET VISIBLE:C603(*; "lbl_sample"; (Form:C1466.local.formatSample#""))
		
		OBJECT SET ENABLED:C1123(*; "btn_OK"; (Form:C1466.formulaSource#""))
		OBJECT SET ENABLED:C1123(*; "btn_Insert"; (Form:C1466.formulaSource#""))
		
		
	: ($action="insertFormula")  // executed in parent form context
		
		
		$range:=WP Selection range:C1340(*; $insert.areaName)
		WP INSERT FORMULA:C1703($range; Formula from string:C1601($insert.source); wk replace:K81:177)
		If ($insert.doNext="insertSpace")
			If (Shift down:C543)
				WP INSERT BREAK:C1413($range; wk paragraph break:K81:259; wk append:K81:179; wk include in range:K81:180)
			Else 
				WP SET TEXT:C1574($range; " "; wk append:K81:179; wk include in range:K81:180)
			End if 
			WP SELECT:C1348(*; $insert.areaName; $range.end; $range.end)
		End if 
		
	: ($action="listUpdated")
		
		GET LIST ITEM PARAMETER:C985(Form:C1466.displayedHList.hlist; *; "JSON"; $json)
		If ($json#"")
			
			Form:C1466.local.data:=JSON Parse:C1218($json)
			
			Form:C1466.local.type:=Form:C1466.local.data.type
			Form:C1466.formulaSource:=Form:C1466.local.data.formulaSource
			Form:C1466.formulaName:=Replace string:C233(Form:C1466.local.data.name; "."; " ")
			Form:C1466.local.formatSample:=""
			
			UI_Formula("init"; Form:C1466.local.type)
			
		Else 
			Form:C1466.local.type:=-1
			Form:C1466.formulaSource:=""
			Form:C1466.formulaName:=""
			Form:C1466.local.formatSample:=""
		End if 
		
		UI_Formula("cleanup")
		
	: ($action="resetlist")
		
		Form:C1466.displayedHList.clear()  // clear display list
		Form:C1466.displayedHList:=Form:C1466.contextHList.clone()  // clone (again) from original
		
		Form:C1466.local.formatSample:=""
		Form:C1466.formulaSource:=""
		Form:C1466.formulaName:=""
		
End case 

