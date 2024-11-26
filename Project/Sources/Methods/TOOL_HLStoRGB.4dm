//%attributes = {"invisible":true}
//$color:=Color_HSL_to_RGB ($hue;$saturation;$Light{;$ptrRed;$ptrBlue;$ptrGreen})

#DECLARE($hue : Integer; $luminosity : Integer; $saturation : Integer; $ptrRed : Pointer; $ptrBlue : Pointer; $ptrGreen : Pointer)->$color : Integer

var $Red; $Green; $Blue : Integer
var $Min; $Max; $Delta : Integer


While ($hue<0)
	$hue:=360-$hue
End while 

$hue:=$hue%360  //0 à 360°

$Max:=$luminosity*255/100  //RGB vont de 0 à 255
$Min:=$Max*((100-$saturation)/100)
$Delta:=$Max-$Min

Case of 
		
	: ($hue>=300)
		$hue:=$hue-300
		$Red:=$Max
		$Green:=$Min
		$Blue:=$Max-($Delta*($hue/60))  //Bleu décroissant
		
	: ($hue>=240)
		$hue:=$hue-240
		$Blue:=$Max
		$Green:=$Min
		$Red:=$Min+($Delta*($hue/60))  //Rouge croissant
		
	: ($hue>=180)
		$hue:=$hue-180
		$Blue:=$Max
		$Red:=$Min
		$Green:=$Max-($Delta*($hue/60))  //Vert décroissant
		
	: ($hue>=120)
		$hue:=$hue-120
		$Green:=$Max
		$Red:=$Min
		$Blue:=$Min+($Delta*($hue/60))  //bleu croissant
		
	: ($hue>=60)
		$hue:=$hue-60
		$Green:=$Max
		$Blue:=$Min
		$Red:=$Max-($Delta*($hue/60))  //Rouge décroissant
		
	: ($hue>=0)
		$hue:=$hue-0  //pour la symétrie des autres cas :-)
		$Red:=$Max
		$Blue:=$Min
		$Green:=$Min+($Delta*($hue/60))  //vert croissant
		
End case 

If (Count parameters:C259>=6)
	$ptrRed->:=$Red
	$ptrGreen->:=$Green
	$ptrBlue->:=$Blue
End if 

$color:=($red << 16)+($Green << 8)+$Blue

