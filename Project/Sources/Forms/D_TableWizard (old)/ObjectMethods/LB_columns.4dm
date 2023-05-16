// lb script

var $x; $y; $button; $col; $row; $from; $to : Integer
var $rebuild : Boolean
var $item : Object
var $pict : Picture

$rebuild:=False:C215

Case of 
	: (Form event code:C388=On Clicked:K2:4)
		
	: (Form event code:C388=On Data Change:K2:15)  // check box
		$rebuild:=True:C214
		
	: (Form event code:C388=On Begin Drag Over:K2:44)
		
		LISTBOX GET CELL POSITION:C971(*; "LB_columns"; $col; $row)
		
		Form:C1466.dragInfo:=New object:C1471
		Form:C1466.dragInfo.position:=$row
		Form:C1466.dragContent:=Form:C1466.currentRow
		
	: (Form event code:C388=On Drop:K2:12)
		
		If (Not:C34(Undefined:C82(Form:C1466.dragInfo)))
			LISTBOX GET CELL POSITION:C971(*; "LB_columns"; $col; $row)
			$from:=Form:C1466.dragInfo.position-1
			$to:=Drop position:C608
			//ALERT("drop from "+String($from)+"\r"+"drop to "+String($to))
			
			If ($from<$to)  // bottom to top
				Form:C1466.template.columns.insert($to; Form:C1466.dragContent)
				Form:C1466.template.columns.remove($from)
			Else 
				Form:C1466.template.columns.remove($from)
				Form:C1466.template.columns.insert($to; Form:C1466.dragContent)
			End if 
			
			OB REMOVE:C1226(Form:C1466; "dragInfo")
			$rebuild:=True:C214
		End if 
		
	: (Form event code:C388=On Mouse Leave:K2:34)
		For each ($item; Form:C1466.template.columns)
			$item.drag:=$pict
		End for each 
		Form:C1466.template.columns:=Form:C1466.template.columns
		
	: (Form event code:C388=On Mouse Move:K2:35)
		
		For each ($item; Form:C1466.template.columns)
			$item.drag:=$pict
		End for each 
		
		GET MOUSE:C468($x; $y; $button)
		LISTBOX GET CELL POSITION:C971(*; "LB_columns"; $x; $y; $col; $row)
		
		If ($row>0)
			Form:C1466.template.columns[$row-1].drag:=Form:C1466.dragPicture  //"≡"
		End if 
		Form:C1466.template.columns:=Form:C1466.template.columns
		
End case 

If ($rebuild)
	SET TIMER:C645(-1)
End if 