//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($oCurrent)

C_LONGINT:C283($align)

$oCurrent:=$1

If (Not:C34(OB Is empty:C1297($oCurrent)))
	
	WP GET ATTRIBUTES:C1345($oCurrent;wk text align:K81:49;$align)
	
	(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign1"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign2"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign3"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign4"))->:=0
	
	Case of 
		: ($align=wk left:K81:95)
			(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign1"))->:=1
			
		: ($align=wk center:K81:99)
			(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign2"))->:=1
			
		: ($align=wk right:K81:96)
			(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign3"))->:=1
			
		: ($align=wk justify:K81:100)
			(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign4"))->:=1
			
	End case 
	
End if 