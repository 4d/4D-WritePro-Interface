//%attributes = {}
#DECLARE($range : Object; $protection : Integer)

If ($range#Null:C1517) && (OB Is defined:C1231($range.container)) && ($range.container.type=300)  // 300 == wk type text box
	WP SET ATTRIBUTES:C1342($range.container; wk protected:K81:306; $protection)
End if 

