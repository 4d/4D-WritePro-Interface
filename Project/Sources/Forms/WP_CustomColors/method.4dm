C_LONGINT:C283($x1; $y1; $x2; $y2; $memoX2)
C_LONGINT:C283($svgWidth; $svgHeight)
C_LONGINT:C283($width; $height)
C_LONGINT:C283($nbx; $nby; $zx; $zy)
C_LONGINT:C283($x; $y)
C_LONGINT:C283($i; $j; $n)
C_LONGINT:C283($nbColors; $gap)

C_TEXT:C284($path)
C_TEXT:C284($RootSVG; $rectSVG)
C_TEXT:C284($color_t)

C_POINTER:C301($ptr)

C_OBJECT:C1216($oPalette)

ARRAY OBJECT:C1221($_oFillColors; 0)

Case of 
	: (Form event code:C388=On Deactivate:K2:10)
		CANCEL:C270
		
	: (Form event code:C388=On Load:K2:1)
		
		ARRAY OBJECT:C1221($_oFillColors; 0)
		ARRAY TEXT:C222($_colors_t; 0)
		
		$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Colors.svg"
		If (Test path name:C476($path)=Is a document:K24:1)
			$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "SVGPalette")
			READ PICTURE FILE:C678($path; $ptr->)
		Else 
			$path:=Get 4D folder:C485(Current resources folder:K5:16)+"Colors.json"
			
			If (Test path name:C476($path)=Is a document:K24:1)
				$oPalette:=JSON Parse:C1218(Document to text:C1236($path))
				For ($j; 1; 2)
					ARRAY OBJECT:C1221($_oFillColors; 0)
					
					Case of 
						: (($j=1) & (OB Is defined:C1231($oPalette; "fillColors")))
							OB GET ARRAY:C1229($oPalette; "fillColors"; $_oFillColors)
						: (($j=2) & (OB Is defined:C1231($oPalette; "lineColors")))
							OB GET ARRAY:C1229($oPalette; "lineColors"; $_oFillColors)
					End case 
					
					$n:=Size of array:C274($_oFillColors)
					For ($i; 1; $n)
						APPEND TO ARRAY:C911($_colors_t; OB Get:C1224($_oFillColors{$i}; "rgb"; Is text:K8:3))
					End for 
					
				End for 
				
			Else 
				
				APPEND TO ARRAY:C911($_colors_t; "RGB(108,195,247)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(166,241,99)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(255,247,172)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(254,221,184)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(251,152,157)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(174,122,191)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(99,178,223)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(156,225,90)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(255,224,97)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(255,192,114)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(254,94,94)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(156,69,184)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(72,156,202)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(110,192,56)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(238,203,37)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(255,170,58)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(255,44,34)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(107,32,132)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(54,125,162)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(121,174,61)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(226,184,0)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(236,159,46)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(207,34,43)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(85,19,107)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(22,88,120)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(87,134,37)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(198,146,0)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(210,127,20)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(174,26,22)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(60,10,74)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(17,67,92)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(57,88,24)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(170,124,19)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(173,105,16)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(140,21,18)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(39,6,48)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(255,255,255)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(204,204,204)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(153,153,153)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(102,102,102)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(51,51,51)")
				APPEND TO ARRAY:C911($_colors_t; "RGB(0,0,0)")
			End if 
			
			// build SVG
			OBJECT GET COORDINATES:C663(*; "SVGPalette"; $x1; $y1; $x2; $y2)
			$svgWidth:=$x2-$x1
			$svgHeight:=$y2-$y1
			
			
			$gap:=5
			$nbColors:=Size of array:C274($_colors_t)
			$nbx:=Int:C8($nbColors^(1/2))
			$nby:=$nbx
			If (($nbx*$nby)<$nbColors)
				$nby:=$nby+1
			End if 
			
			$width:=($svgWidth-(($nbx+1)*$gap))/$nbx
			$height:=($svgHeight-(($nby+1)*$gap))/$nby
			
			$RootSVG:=SVG_New($svgWidth; $svgHeight; "sidebar"; "sidebar"; True:C214)  //;Scaled to fit prop centered)
			
			$x:=$gap
			$y:=$gap
			$n:=0
			For ($zy; 1; $nby)
				For ($zx; 1; $nbx)
					$n:=$n+1
					If ($n<=$nbColors)
						$color_t:=$_colors_t{$n}
						$rectSVG:=SVG_New_rect($RootSVG; $x; $y; $width; $height; 0; 0; "black"; $color_t; 0.5)
						SVG_SET_ATTRIBUTES($rectSVG; "id"; String:C10($n))
					End if 
					$x:=$x+$width+$gap
				End for 
				$y:=$y+$height+$gap
				$x:=$gap
				
			End for 
			$ptr:=OBJECT Get pointer:C1124(Object named:K67:5; "SVGPalette")
			$ptr->:=SVG_Export_to_picture($RootSVG)
		End if 
		
		If (wp_allowTransparency=False:C215)
			
			OBJECT GET COORDINATES:C663(*; "btnTransparent"; $x1; $y1; $x2; $y2)
			OBJECT SET VISIBLE:C603(*; "btnTransparent"; False:C215)
			$memoX2:=$x2
			OBJECT GET COORDINATES:C663(*; "sample"; $x1; $y1; $x2; $y2)
			OBJECT SET COORDINATES:C1248(*; "sample"; $x1; $y1; $memoX2; $y2)
			
		End if 
		
End case 
