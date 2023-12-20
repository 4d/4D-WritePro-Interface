//%attributes = {}
// method created after ACI0104450 to factorise the code

#DECLARE($fontFamily : Text)

ARRAY TEXT:C222(WP_fontStyle; 0)
ARRAY TEXT:C222(WP_fontLongName; 0)
FONT STYLE LIST:C1362($fontFamily; WP_fontStyle; WP_fontLongName)

WP_fontStyle:=1
//If (Size of array(WP_fontStyle)=1)
//OBJECT SET ENABLED(*; "fontStyle"; False)
//Else 
//OBJECT SET ENABLED(*; "fontStyle"; True)
//End if 