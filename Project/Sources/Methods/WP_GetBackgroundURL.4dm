//%attributes = {"invisible":true}
C_OBJECT:C1216($1)
C_OBJECT:C1216($range)

C_TEXT:C284($url)
C_TEXT:C284($codec)
C_POINTER:C301($ptr)
C_LONGINT:C283($p)

C_BLOB:C604($blob)
C_PICTURE:C286($picture)

$range:=$1

If (Not:C34(OB Is empty:C1297($range)))
	
	WP GET ATTRIBUTES:C1345($range;wk background image:K81:21;$url)
	
	Case of 
		: ($url="data:image/@")
			  //   data:image/x-png;base64,iVBORw0KGgoAAAANSUhEUgAAAK
			$url:=Substring:C12($url;12)
			  //   x-png;base64,iVBORw0KGgoAAAANSUhEUgAAAK
			$p:=Position:C15(";base64,";$url)
			If ($p>0)
				
				$codec:="."+Substring:C12($url;1;$p-1)
				If ($codec=".x-png")
					$codec:=".png"
				End if 
				
				$url:=Substring:C12($url;$p+8)
				
				BASE64 DECODE:C896($url;$blob)
				
				BLOB TO PICTURE:C682($blob;$picture;$codec)
				
			End if 
			
		: ($url="data:@")
			  //   data:;base64,R0lGODlhLAGQAff/APr6+g0NDRgY
			$p:=Position:C15(";base64,";$url)
			If ($p>0)
				$url:=Substring:C12($url;$p+8)
				BASE64 DECODE:C896($url;$blob)
				BLOB TO PICTURE:C682($blob;$picture)
			End if 
			
	End case 
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"bgndPictPreview")
	$ptr->:=$picture
	
End if 



