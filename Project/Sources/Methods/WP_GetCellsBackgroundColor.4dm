//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($oCurrent)

C_LONGINT:C283($color)
C_LONGINT:C283($frameColor)

$oCurrent:=$1

$frameColor:=0x00404040

If (Not:C34(OB Is empty:C1297($oCurrent)))
	
	OBJECT SET RGB COLORS:C628(*;"backgroundColor";0x00FFFFFF;0x00FFFFFF)
	  //OBJECT SET VISIBLE(*;"InvisibleBackground";False)
	  //OBJECT SET VISIBLE(*;"MultiBackgroundColor";False)
	
	$oCurrent:=WP Table get cells:C1477($oCurrent)
	If (Not:C34($oCurrent=Null:C1517))
		WP GET ATTRIBUTES:C1345($oCurrent;wk background color:K81:20;$color)
	Else 
		$color:=wk transparent:K81:134
	End if 
	
	Case of 
		: ($color=wk transparent:K81:134)
			OBJECT SET VISIBLE:C603(*;"InvisibleBackground";True:C214)
			
		: ($color=wk mixed:K81:89)
			OBJECT SET VISIBLE:C603(*;"MultiBackgroundColor";True:C214)
			
		Else 
			OBJECT SET RGB COLORS:C628(*;"backgroundColor";$color;$color)
	End case 
	
End if 

