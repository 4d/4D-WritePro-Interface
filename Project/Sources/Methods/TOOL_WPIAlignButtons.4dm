//%attributes = {"invisible":true}
  //TOOL_AlignButtons (->$ArrayObjectNames;->$ArrayObjectLabels;"Left";"top";"Horizontal";"proportional";0;->$ArrayMargins;->$ArraySpaces;$ArrayHeight)

  // modifiée par RL le 10 mai 2011  ∆∆∆
  // sur WIN pour les JAPONAIS on AJOUTE 4 pixels SYSTEMATIQUEMENT
  // finalement non… (mis en if(false))

If (False:C215)  //EXEMPLE D'APPEL DE LA METHODE (Seul le premier parametre est obligatoire)
	ARRAY TEXT:C222($_ObjectNames;5)
	ARRAY TEXT:C222($_ObjectLabels;5)
	ARRAY LONGINT:C221($_Margin;2)
	ARRAY LONGINT:C221($_Space;2)
	ARRAY LONGINT:C221($_Height;2)
	ARRAY LONGINT:C221($_MinWidth;2)
	
	
	$_ObjectNames{1}:="Bouton1"
	$_ObjectNames{2}:="Bouton2"
	$_ObjectNames{3}:="Bouton3"
	$_ObjectNames{4}:="Bouton4"
	$_ObjectNames{5}:="Bouton5"
	
	$_ObjectLabels{1}:="Alpha-Bravo"
	$_ObjectLabels{2}:="Charlie-Delta"
	$_ObjectLabels{3}:="Uniform"
	$_ObjectLabels{4}:="Golf"
	$_ObjectLabels{5}:="Zoulou-Tango"
	
	$_Height{1}:=20  //win
	$_Height{2}:=23  //mac
	
	$_Margin{1}:=2  //win
	$_Margin{2}:=2  //mac
	
	$_Space{1}:=10  //win
	$_Space{2}:=10  //mac
	
	$_MinWidth{1}:=50  //win
	$_MinWidth{2}:=0
	
	TOOL_WPIAlignButtons (->$_ObjectNames;->$_ObjectLabels;Horizontally centered:K39:1;At the top:K39:5;"Horizontal";"Proportional";0;->$_Height;->$_Margin;->$_Space;->$_MinWidth)
End if 

  //mandatory parameters
C_POINTER:C301($1)  //pointer on array of object names
C_POINTER:C301($2)  //pointer on array of object labels

  //optional parameters

C_LONGINT:C283($3)  //horizontal reference (left;center;right)            `default : left (use 4D constants)
C_LONGINT:C283($4)  //vertical reference (top;center;bottom)            `default : top (use 4D constants)
C_TEXT:C284($5)  //Alignement type ("horizontal" / "vertical")              `default : horizontal
C_TEXT:C284($6)  //mode ("fixed"/"proportional")                                `default : proportionnal
C_LONGINT:C283($7)  // "fixed value"  (for fixed mode)                   `if 0 and "fixed mode" : biggest Horizontal size needed,  ignored if proportional
C_POINTER:C301($8)  //pointer on array of button heights  (2 items : Win/Mac, default 23/20)
C_POINTER:C301($9)  //pointer on array of text margins (inside buttons) (2 items : Win/Mac, default 0/0)
C_POINTER:C301($10)  //pointer on array of spaces (between buttons) (2 items : Win/Mac, default 10/10)

C_POINTER:C301($11)  //min witdh of buttons
C_POINTER:C301($12)  //rounded to… (i.e; to get buttons of size multiple of 10)

  //variables de réafectation des parametres

C_POINTER:C301($PtrArrayObjectNames)  //pointer on array of object names
C_POINTER:C301($PtrArrayObjectLabels)  //pointer on array of object labels
C_LONGINT:C283($HorizontalAlign)  //horizontal reference ("Left";"Center";"Right")
C_LONGINT:C283($VerticalAlign)  //vertical reference ("Top";"Center";"Bottom")
C_TEXT:C284($AlignementType)  //Alignement type ("Horizontal" / "Vertical")
C_TEXT:C284($SizeMode)  //mode ("fixed"/"proportionnal")
C_LONGINT:C283($RoundValue)  //value for "round to"
C_LONGINT:C283($SizeValue)  //Value for "fixed", value ignored for "proportional"

C_POINTER:C301($PtrRefVariable)  //pointer on test variable (needed only if "proportional")
C_LONGINT:C283($TextMargin)  //pointer on array of text margins (inside buttons) (2 items : Win/Mac, usualy 5/5)
C_LONGINT:C283($ButtonSpace)  //pointer on array of spaces (between buttons) (2 items : Win/Mac, usualy 10/10)
C_LONGINT:C283($ButtonHeight)  //pointer on array of button heights  (2 items : Win/Mac, usualy 23/20)
C_LONGINT:C283($ButtonMinWidth)
C_LONGINT:C283($RoundValue)
C_LONGINT:C283($GlobalWidth;$GlobalHeight)
C_LONGINT:C283($Offset_H;$Offset_V)

  //Variables locales
C_LONGINT:C283($Plateform)
C_LONGINT:C283($i;$n)
C_LONGINT:C283($RoundValue)
C_LONGINT:C283($x1;$x2;$y1;$y2)
C_LONGINT:C283($Left;$Top;$Right;$Bottom)

_O_PLATFORM PROPERTIES:C365($Plateform)
$Plateform:=Choose:C955($Plateform=Windows:K25:3;1;2)

  // Gestion des paramètres

$PtrArrayObjectNames:=$1

If (Count parameters:C259>=2)
	$PtrArrayObjectLabels:=$2
End if 

If (Count parameters:C259>=3)
	$HorizontalAlign:=$3
Else 
	$HorizontalAlign:=On the left:K39:2
End if 

If (Count parameters:C259>=4)
	$VerticalAlign:=$4
Else 
	$VerticalAlign:=At the top:K39:5
End if 

If (Count parameters:C259>=5)
	$AlignementType:=$5
Else 
	$AlignementType:="Horizontal"
End if 

If (Count parameters:C259>=6)
	$SizeMode:=$6
Else 
	$SizeMode:="Proportional"
End if 

If (Count parameters:C259>=7)
	$SizeValue:=$7
Else 
	$SizeValue:=0
End if 

If (Count parameters:C259>=8)
	$ButtonHeight:=$8->{$Plateform}
Else 
	$ButtonHeight:=Choose:C955($Plateform=1;23;20)
End if 

If (Count parameters:C259>=9)
	$TextMargin:=$9->{$Plateform}
Else 
	$TextMargin:=0
End if 

If (Count parameters:C259>=10)
	$ButtonSpace:=$10->{$Plateform}
Else 
	$ButtonSpace:=10
End if 

If (Count parameters:C259>=11)  //largeur minimum d'un bouton
	$ButtonMinWidth:=$11->{$Plateform}
Else 
	$ButtonMinWidth:=20
End if 

If (Count parameters:C259>=12)  //arrondi à une valeur donnée
	$RoundValue:=$12->{$Plateform}
Else 
	$RoundValue:=0
End if 

$n:=Size of array:C274($PtrArrayObjectNames->)

$n:=Size of array:C274($PtrArrayObjectNames->)
ARRAY LONGINT:C221($_btnWidth;$n)

  //Cas le pire, il faut calculer la plus grande taille des boutons

If ($SizeMode="Fixed") & ($SizeValue=0)
	
	For ($i;1;$n;1)
		
		If (Not:C34(Is nil pointer:C315($PtrArrayObjectLabels)))
			
			OBJECT SET TITLE:C194(*;$PtrArrayObjectNames->{$i};$PtrArrayObjectLabels->{$i})
			
		End if 
		
		If (False:C215)
			$PtrRefVariable->:=$PtrArrayObjectLabels->{$i}
			OBJECT GET BEST SIZE:C717($PtrRefVariable->;$x1;$y1)  // variable
			
		Else 
			
			OBJECT GET BEST SIZE:C717(*;$PtrArrayObjectNames->{$i};$x1;$y1)  // nom d'objet
		End if 
		
		If ($x1>$SizeValue)
			
			$SizeValue:=$x1
			
		End if 
	End for 
	
	If ($RoundValue>1)
		
		$SizeValue:=$RoundValue*Int:C8(($SizeValue+1+$RoundValue)/$RoundValue)
		
	End if 
End if 

  //1ere "vraie" boucle pour calculer la taille définitive des boutons ET les moyennes

$GlobalWidth:=0
$GlobalHeight:=0

For ($i;1;$n;1)
	
	If ($SizeMode="Fixed")
		
		$_btnWidth{$i}:=$SizeValue+(2*$TextMargin)
		
	Else   //"proportional"
		
		If (Not:C34(Is nil pointer:C315($PtrArrayObjectLabels)))
			
			OBJECT SET TITLE:C194(*;$PtrArrayObjectNames->{$i};$PtrArrayObjectLabels->{$i})
			
		End if 
		
		If (False:C215)
			$PtrRefVariable->:=$PtrArrayObjectLabels->{$i}
			OBJECT GET BEST SIZE:C717($PtrRefVariable->;$x1;$y1)
			
		Else 
			
			OBJECT GET BEST SIZE:C717(*;$PtrArrayObjectNames->{$i};$x1;$y1)
		End if 
		
		$_btnWidth{$i}:=$x1+(2*$TextMargin)
		
		  //Need to round to ?
		If ($RoundValue>1)
			
			$_btnWidth{$i}:=$RoundValue*Int:C8(($_btnWidth{$i}+1+$RoundValue)/$RoundValue)
			
		End if 
		
		  //minimum value for width ?
		If ($_btnWidth{$i}<$ButtonMinWidth)
			
			$_btnWidth{$i}:=$ButtonMinWidth
			
		End if 
		
		  //If (False)
		  //  // sur WIN pour les JAPONAIS on AJOUTE 4 pixels SYSTEMATIQUEMENT ∆∆∆
		  //If (Get database localization="ja") & (Folder separator#":")  //   / ou \ je sais jamais donc j'ai mis # ":"
		  //$_btnWidth{$i}:=$_btnWidth{$i}+4
		  //End if
		  //End if
		
	End if 
	
	$GlobalWidth:=$GlobalWidth+$_btnWidth{$i}+$ButtonSpace  //sert en cas d'alignement horizontal
	$GlobalHeight:=$GlobalHeight+$ButtonHeight+$ButtonSpace  //sert en cas d'alignement vertical
	
End for 

$GlobalWidth:=$GlobalWidth-$ButtonSpace  //sert en cas d'alignement horizontal (on retire un espace ajouté en trop en fin de boucle)
$GlobalHeight:=$GlobalHeight-$ButtonSpace  //sert en cas d'alignement vertical (on retire un espace ajouté en trop en fin de boucle)

If ($AlignementType="Horizontal")
	
	Case of 
			
			  //________________________________________
		: ($HorizontalAlign=On the left:K39:2)
			
			  //affecte la valeur $Left directement à partir de la GAUCHE du PREMIER objet
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{1};$Left;$y1;$x2;$y2)
			
			  //________________________________________
		: ($HorizontalAlign=Horizontally centered:K39:1)
			
			  //on prend la gauche de l'objet 1 et la droite de l'objet n, on en fait la moyenne, puis on soustrait la demi-largeur globale
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{1};$Left;$y1;$x2;$y2)
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{$n};$x1;$y1;$Right;$y2)
			$Left:=Round:C94(($Left+$Right-$GlobalWidth)/2;0)
			
			  //________________________________________
		: ($HorizontalAlign=On the right:K39:3)
			
			  //affecte la valeur $Left à partir de la DROITE du DERNIER objet moins la largeur globale
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{$n};$x1;$y1;$Right;$y2)
			$Left:=$Right-$GlobalWidth  //affecte la valeur $Left en fonction de la droite - largeur globale
			
			  //________________________________________
	End case 
	
	Case of 
			
			  //________________________________________
		: ($VerticalAlign=At the top:K39:5)
			
			  //affecte la valeur $Top directement à partir de HAUT du PREMIER objet
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{1};$x1;$Top;$x2;$y2)
			
			  //________________________________________
		: ($VerticalAlign=Vertically centered:K39:4)
			
			  //affecte la valeur $Top à partir de moyenne du HAUT du PREMIER et du BAS du DERNIER objet moins la demi-Hauteur GLOBALE
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{1};$x1;$Top;$x2;$y2)
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{$n};$x1;$y1;$x2;$Bottom)
			$Top:=Round:C94(($Top+$Bottom-$ButtonHeight)/2;0)
			
			  //________________________________________
		: ($VerticalAlign=At the bottom:K39:6)
			
			  //affecte la valeur $Top à partir du BAS du DERNIER objet moins la Hauteur GLOBALE
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{$n};$x1;$y1;$x2;$Bottom)
			$Top:=$Bottom-$ButtonHeight
			
			  //________________________________________
	End case 
	
Else   //alignement vertical des boutons
	
	Case of 
			
			  //________________________________________
		: ($HorizontalAlign=On the left:K39:2)
			
			  //affecte la valeur $HorizontalRef directement à partir de la GAUCHE du PREMIER objet
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{1};$HorizontalRef;$y1;$x2;$y2)
			
			  //________________________________________
		: ($HorizontalAlign=Horizontally centered:K39:1)
			
			  //affecte la valeur $HorizontalRef à partir de moyenne de la gauche de l'objet 1 et la droite du dernier objet
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{1};$Left;$y1;$x2;$y2)
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{$n};$x1;$y1;$Right;$y2)
			$HorizontalRef:=Round:C94(($Left+$Right)/2;0)
			
			  //________________________________________
		: ($HorizontalAlign=On the right:K39:3)
			
			  //affecte la valeur $HorizontalRef directement à partir de la DROITE du DERNIER objet
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{$n};$x1;$y1;$HorizontalRef;$y2)
			
			  //________________________________________
	End case 
	
	Case of 
			
			  //________________________________________
		: ($VerticalAlign=At the top:K39:5)
			
			  //affecte la valeur $Top directement à partir de HAUT du PREMIER objet
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{1};$x1;$Top;$x2;$y2)
			
			  //________________________________________
		: ($VerticalAlign=Vertically centered:K39:4)
			
			  //affecte la valeur $Top à partir de moyenne du HAUT du PREMIER et du BAS du DERNIER objet moins la demi-Hauteur de bouton
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{1};$x1;$Top;$x2;$y2)
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{$n};$x1;$y1;$x2;$Bottom)
			$Top:=Round:C94(($Top+$Bottom-$GlobalHeight)/2;0)
			
			  //________________________________________
		: ($VerticalAlign=At the bottom:K39:6)
			
			  //affecte la valeur $Top à partir du BAS du DERNIER objet moins la Hauteur de bouton
			OBJECT GET COORDINATES:C663(*;$PtrArrayObjectNames->{$n};$x1;$y1;$x2;$Bottom)
			$Top:=$Bottom-$GlobalHeight
			
			  //________________________________________
	End case 
End if 

If ($AlignementType="Horizontal")
	
	$Offset_H:=$Left
	
	For ($i;1;$n;1)
		
		OBJECT MOVE:C664(*;$PtrArrayObjectNames->{$i};$Offset_H;$Top;$Offset_H+$_btnWidth{$i};$Top+$ButtonHeight;*)
		$Offset_H:=$Offset_H+$_btnWidth{$i}+$ButtonSpace
		
	End for 
	
Else   //alignement vertical des boutons
	
	$Offset_V:=$Top
	
	For ($i;1;$n;1)
		
		Case of 
				
				  //________________________________________
			: ($HorizontalAlign=On the left:K39:2)
				
				OBJECT MOVE:C664(*;$PtrArrayObjectNames->{$i};$HorizontalRef;$Offset_V;$HorizontalRef+$_btnWidth{$i};$Offset_V+$ButtonHeight;*)
				
				  //________________________________________
			: ($HorizontalAlign=Horizontally centered:K39:1)
				
				OBJECT MOVE:C664(*;$PtrArrayObjectNames->{$i};$HorizontalRef-($_btnWidth{$i}/2);$Offset_V;$HorizontalRef+($_btnWidth{$i}/2);$Offset_V+$ButtonHeight;*)
				
				  //________________________________________
			: ($HorizontalAlign=On the right:K39:3)
				
				OBJECT MOVE:C664(*;$PtrArrayObjectNames->{$i};$HorizontalRef-$_btnWidth{$i};$Offset_V;$HorizontalRef;$Offset_V+$ButtonHeight;*)
				
				  //________________________________________
		End case 
		
		$Offset_V:=$Offset_V+$ButtonHeight+$ButtonSpace
		
	End for 
End if 