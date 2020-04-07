//%attributes = {"invisible":true}
C_OBJECT:C1216($1)

C_OBJECT:C1216($range)
C_LONGINT:C283($verticalAlign)



$range:=$1
(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign5"))->:=0
(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign6"))->:=0
(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign7"))->:=0

If (Not:C34(OB Is empty:C1297($range)))
	
	WP GET ATTRIBUTES:C1345($range;wk vertical align:K81:9;$verticalAlign)
	Case of 
		: ($verticalAlign=wk top:K81:97)
			(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign5"))->:=1
		: ($verticalAlign=wk middle:K81:101)
			(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign6"))->:=1
		: ($verticalAlign=wk bottom:K81:98)
			(OBJECT Get pointer:C1124(Object named:K67:5;"bAlign7"))->:=1
	End case 
	
End if 
