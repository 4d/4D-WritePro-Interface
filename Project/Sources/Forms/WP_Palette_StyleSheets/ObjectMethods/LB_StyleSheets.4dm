C_LONGINT:C283($col;$n;$p)
C_OBJECT:C1216($memo)
C_OBJECT:C1216($styleSheet)
C_POINTER:C301($ptrLB;$ptrStylesheetNames)
C_TEXT:C284($stylesheetName;$newName)



$ptrLB:=OBJECT Get pointer:C1124(Object named:K67:5;"LB_StyleSheets")
$ptrStylesheetNames:=OBJECT Get pointer:C1124(Object named:K67:5;"stylesheet_Names")

LISTBOX GET CELL POSITION:C971(*;"LB_StyleSheets";$col;$n)

If ($n>0) & ($n<=Size of array:C274($ptrStylesheetNames->))
	
	Case of 
			
			  //: (Form event code=On Clicked)
			
			  //If (Contextual click) & (Shift down) & (Macintosh option down)
			  //WP_StylesheetEdit 
			  //End if 
			
		: (Form event code:C388=On Selection Change:K2:29) | (Form event code:C388=On Clicked:K2:4)
			
			$stylesheetName:=$ptrStylesheetNames->{$n}
			WP SET ATTRIBUTES:C1342(Form:C1466.selection;wk style sheet:K81:63;$stylesheetName)
			
			SET TIMER:C645(-1)
			
		: (Form event code:C388=On Before Data Entry:K2:39)
			
			$stylesheetName:=$ptrStylesheetNames->{$n}
			If ($stylesheetName="Normal")
				$0:=-1
			Else 
				$memo:=New object:C1471
				$memo.name:=$stylesheetName
				$memo.position:=$n
				Form:C1466.memo:=$memo
			End if 
			
		: (Form event code:C388=On Data Change:K2:15)
			
			$memo:=Form:C1466.memo
			
			$newName:=$ptrStylesheetNames->{$memo.position}
			$p:=Count in array:C907($ptrStylesheetNames->;$newName)
			
			If ($p>1)
				BEEP:C151
				$ptrStylesheetNames->{$memo.position}:=$memo.name
				
			Else 
				  // rename the style sheet
				$styleSheet:=WP Get style sheet:C1656(Form:C1466.document;Form:C1466.memo.name)
				If ($styleSheet#Null:C1517)
					$styleSheet.name:=$newName
					
					WP_GetStyleSheets   // reload list
					
				End if 
			End if 
			
	End case 
	
End if 