C_LONGINT:C283($i;$j;$x;$y;$width;$height;$svgWidth;$svgHeight)
C_OBJECT:C1216($sel;$cells;$currentCell)
C_TEXT:C284($path)
C_TEXT:C284($color)
C_TEXT:C284($svg;$svgRect)

$width:=20
$height:=6


$sel:=WP Selection range:C1340([SAMPLE:1]WP:2)
$cells:=WP Table get cells:C1477($sel)
If (Not:C34($cells=Null:C1517))
	
	$svgWidth:=($width*$cells.columnCount)+2
	$svgHeight:=($height*$cells.rowCount)+1
	
	If ($svgWidth<82)
		$svgWidth:=82
	End if 
	If ($svgHeight<30)
		$svgHeight:=30
	End if 
	
	
	SVG_SET_OPTIONS (SVG_Get_options  ?+ 5)
	
	$svg:=SVG_New ($svgWidth;$svgHeight)  //;"";"")  //;True)//;Scaled to fit prop centered)
	$x:=1
	$y:=1
	
	For ($i;1;$cells.columnCount)
		
		For ($j;1;$cells.rowCount)
			
			$currentCell:=WP Table get cells:C1477($cells.table;$i;$j;1;1)
			WP GET ATTRIBUTES:C1345($currentCell;wk background color:K81:20;$color)
			
			If ($color="transparent")
				$color:="#FFFFFF"
			End if 
			
			$svgRect:=SVG_New_rect ($svg;$x;$y;$width;$height;0;0;"black";$color;1)
			
			
			$y:=$y+$height
		End for 
		$x:=$x+$width
		$y:=1
		
	End for 
	
	SVG_SET_SHAPE_RENDERING ($svg;"crispEdges")
	
	  //SVGTool_SHOW_IN_VIEWER ($svg)
	
	SVG EXPORT TO PICTURE:C1017($svg;vSVG)
	
	$path:=Get 4D folder:C485(Current resources folder:K5:16)+"table_templates"
	$Path:=$path+Folder separator:K24:12+"TableTemplate_"+String:C10(templateID;"00")+".png"
	WRITE PICTURE FILE:C680($path;vSVG;".png")
	
End if 


