//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_LONGINT:C283($h;$v)

$range:=$1
If (Not:C34(OB Is empty:C1297($range)))
	
	(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos11"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos12"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos13"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos21"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos22"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos23"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos31"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos32"))->:=0
	(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos33"))->:=0
	
	WP GET ATTRIBUTES:C1345($range;wk background position horizontal:K81:22;$h;wk background position vertical:K81:23;$v)
	
	Case of 
		: ($h=wk left:K81:95) & ($v=wk top:K81:97)
			(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos11"))->:=1
			
		: ($h=wk center:K81:99) & ($v=wk top:K81:97)
			(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos12"))->:=1
			
		: ($h=wk right:K81:96) & ($v=wk top:K81:97)
			(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos13"))->:=1
			
		: ($h=wk left:K81:95) & ($v=wk middle:K81:101)
			(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos21"))->:=1
			
		: ($h=wk center:K81:99) & ($v=wk middle:K81:101)
			(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos22"))->:=1
			
		: ($h=wk right:K81:96) & ($v=wk middle:K81:101)
			(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos23"))->:=1
			
		: ($h=wk left:K81:95) & ($v=wk bottom:K81:98)
			(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos31"))->:=1
			
		: ($h=wk center:K81:99) & ($v=wk bottom:K81:98)
			(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos32"))->:=1
			
		: ($h=wk right:K81:96) & ($v=wk bottom:K81:98)
			(OBJECT Get pointer:C1124(Object named:K67:5;"rbPos33"))->:=1
			
	End case 
	
End if 
