//%attributes = {"invisible":true}
//ACI0098389  2018/07/10

#DECLARE($range : Object)

var $textLineHeight : Real
var $textLineHeight_t : Text
var $ptrTextLineHeightUnit : Pointer
var $p : Integer

If (Not:C34(OB Is empty:C1297($range)))
	
	//ACI0098389  2018/07/10
	
	$ptrTextLineHeightUnit:=OBJECT Get pointer:C1124(Object named:K67:5; "TextLineHeightUnit")
	
	WP Get attributes:C1345($range; wk line height:K81:51; $textLineHeight_t)  // get the line height as TEXT
	
	$p:=Position:C15("pt"; $textLineHeight_t)  // expressed in "pt" ?
	If ($p>0)
		$textLineHeight:=Num:C11(Substring:C12($textLineHeight_t; 1; $p-1))
		$ptrTextLineHeightUnit->:=2
	Else 
		$p:=Position:C15("%"; $textLineHeight_t)  // expressed in "%" ?
		If ($p>0)
			$textLineHeight:=Num:C11(Substring:C12($textLineHeight_t; 1; $p-1))
			$ptrTextLineHeightUnit->:=1
		Else 
			$ptrTextLineHeightUnit->:=1
			$textLineHeight:=100
		End if 
	End if 
	
	(OBJECT Get pointer:C1124(Object named:K67:5; "textLineHeightRuler"))->:=$textLineHeight
	(OBJECT Get pointer:C1124(Object named:K67:5; "textLineHeightInput"))->:=$textLineHeight
	
End if 
