//%attributes = {"invisible":true}
//Color_RGB_to_HSL($Color;->Hue;->Luminosity;->Salturation)

#DECLARE($color : Integer; $huePtr : Pointer; $luminosityPtr : Pointer; $saturationPtr : Pointer)

var $Red; $Green; $Blue : Integer
var $hue; $saturation; $luminosity : Integer

$Red:=(($color & 0x00FF0000) >> 16)*100/255
$Green:=(($color & 0xFF00) >> 8)*100/255
$Blue:=($color & 0x00FF)*100/255

Case of 
	: ($Green=$Blue) & ($Red>$Green)  //0°
		$luminosity:=$Red
		$saturation:=100*($luminosity-$Blue)/$luminosity
		$hue:=0
		
	: ($Red>$Green) & ($Green>$Blue)  //1° to 59°
		$luminosity:=$Red
		$saturation:=100*($luminosity-$Blue)/$luminosity
		$hue:=0+(60*(($Green-$Blue)/($Red-$Blue)))  //plus le vert croit, plus le HUE croit
		
	: ($Green=$Red) & ($Red>$Blue)  //60°
		$luminosity:=$Red
		$saturation:=100*($luminosity-$Blue)/$luminosity
		$hue:=60
		
	: ($Green>$Red) & ($Red>$Blue)  //61° to 119°
		$luminosity:=$Green
		$saturation:=100*($luminosity-$Blue)/$luminosity
		$hue:=60+(60*(($Green-$Red)/($Green-$Blue)))  //plus le Rouge décroit, plus le HUE croit
		
	: ($Blue=$Red) & ($Green>$Blue)  //120°
		$luminosity:=$Green
		$saturation:=100*($luminosity-$Red)/$luminosity
		$hue:=120
		
	: ($Green>$Blue) & ($Blue>$Red)  //121° to 179°
		$luminosity:=$Green
		$saturation:=100*($luminosity-$Red)/$luminosity
		$hue:=120+(60*(($Blue-$Red)/($Green-$Red)))  //plus le bleu croit, plus le HUE croit
		
	: ($Blue=$Green) & ($Green>$Red)  //180°
		$luminosity:=$Green
		$saturation:=100*($luminosity-$Red)/$luminosity
		$hue:=180  //180
		
	: ($Blue>$Green) & ($Green>$Red)  //181° to 239°
		$luminosity:=$Blue
		$saturation:=100*($luminosity-$Red)/$luminosity
		$hue:=180+(60*(($Blue-$Green)/($Blue-$Red)))  //plus le Vert décroit, plus le HUE croit
		
	: ($Red=$Green) & ($Blue>$Red)  //240°
		$luminosity:=$Blue
		$saturation:=100*($luminosity-$Green)/$luminosity
		$hue:=240
		
	: ($Blue>$Red) & ($Red>$Green)  //241° to 299°
		$luminosity:=$Blue
		$saturation:=100*($luminosity-$Green)/$luminosity
		$hue:=240+(60*(($Red-$Green)/($Blue-$Green)))  //plus le rouge croit, plus le HUE croit
		
	: ($Red=$Blue) & ($Blue>$Green)  //300°
		$luminosity:=$Blue
		$saturation:=100*($luminosity-$Green)/$luminosity
		$hue:=300
		
	: ($Red>$Blue) & ($Blue>$Green)  //301° to 359°
		$luminosity:=$Red
		$saturation:=100*($luminosity-$Green)/$luminosity
		$hue:=300+(60*(($Red-$Blue)/($Red-$Green)))  //plus le Bleu décroit, plus le HUE croit
		
		
	: ($Red=$Blue) & ($Blue=$Green)
		$luminosity:=$Blue  //or red or green
		$saturation:=0
		$hue:=0
		
End case 


$huePtr->:=$hue
$luminosityPtr->:=$luminosity
$saturationPtr->:=$saturation


