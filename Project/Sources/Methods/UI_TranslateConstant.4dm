//%attributes = {"invisible":true}
C_TEXT:C284($1;$attribute)
C_LONGINT:C283($2;$value)
C_TEXT:C284($0)

$attribute:=$1
$value:=$2

Case of 
	: ($Attribute=wk text underline style:K81:73) | ($Attribute=wk text linethrough style:K81:75)
		
		Case of 
			: ($value=wk none:K81:91)
				$0:=Get localized string:C991("None")
			: ($value=wk solid:K81:115)
				$0:=Get localized string:C991("Solid")
			: ($value=wk dotted:K81:116)
				$0:=Get localized string:C991("Dotted")
			: ($value=wk dashed:K81:117)
				$0:=Get localized string:C991("Dashed")
			: ($value=wk double:K81:118)
				$0:=Get localized string:C991("Double")
			: ($value=wk semi transparent:K81:119)
				$0:=Get localized string:C991("Semi")
			: ($value=wk word:K81:120)
				$0:=Get localized string:C991("Word")
		End case 
		
	: ($attribute=wk text transform:K81:70)
		
		Case of 
			: ($value=wk none:K81:91)
				$0:=Get localized string:C991("TextTransformNone")
			: ($value=wk capitalize:K81:163)
				$0:=Get localized string:C991("Capitalize")
			: ($value=wk lowercase:K81:121)
				$0:=Get localized string:C991("Lowercase")
			: ($value=wk uppercase:K81:122)
				$0:=Get localized string:C991("Uppercase")
			: ($value=wk small uppercase:K81:123)
				$0:=Get localized string:C991("SmallUppercase")
		End case 
		
	: ($attribute=wk text align:K81:49)
		
		Case of 
			: ($value=wk default:K81:160)
				$0:=Get localized string:C991("ssAlignDefault")
			: ($value=wk left:K81:95)
				$0:=Get localized string:C991("ssAlignLeft")
			: ($value=wk center:K81:99)
				$0:=Get localized string:C991("ssAlignCenter")
			: ($value=wk right:K81:96)
				$0:=Get localized string:C991("ssAlignRight")
			: ($value=wk justify:K81:100)
				$0:=Get localized string:C991("ssAlignJustified")
		End case 
		
	: ($attribute=wk vertical align:K81:9)
		Case of 
			: ($value=wk default:K81:160)
				$0:=Get localized string:C991("ssAlignDefault")
			: ($value=wk baseline:K81:102)
				$0:=Get localized string:C991("ssAlignBase")
			: ($value=wk top:K81:97)
				$0:=Get localized string:C991("ssAlignTop")
			: ($value=wk middle:K81:101)
				$0:=Get localized string:C991("ssAlignMiddle")
			: ($value=wk bottom:K81:98)
				$0:=Get localized string:C991("ssAlignBottom")
			: ($value=wk superscript:K81:103)
				$0:=Get localized string:C991("ssAlignSuperscript")
			: ($value=wk subscript:K81:104)
				$0:=Get localized string:C991("ssAlignSubscript")
			Else 
				$0:="-"
		End case 
		
		
	: ($attribute=wk border style:K81:29) | ($attribute=wk border style top:K81:32) | ($attribute=wk border style bottom:K81:33) | ($attribute=wk border style left:K81:30) | ($attribute=wk border style right:K81:31)
		
		Case of 
			: ($value=wk none:K81:91)
				$0:=Get localized string:C991("None")
			: ($value=wk hidden:K81:128)
				$0:=Get localized string:C991("Hidden")
			: ($value=wk solid:K81:115)
				$0:=Get localized string:C991("Solid")
			: ($value=wk dotted:K81:116)
				$0:=Get localized string:C991("Dotted")
			: ($value=wk dashed:K81:117)
				$0:=Get localized string:C991("Dashed")
			: ($value=wk double:K81:118)
				$0:=Get localized string:C991("Double")
			: ($value=wk groove:K81:129)
				$0:=Get localized string:C991("Groove")
			: ($value=wk ridge:K81:130)
				$0:=Get localized string:C991("Ridge")
			: ($value=wk inset:K81:131)
				$0:=Get localized string:C991("Inset")
			: ($value=wk outset:K81:132)
				$0:=Get localized string:C991("Outset")
			Else 
				$0:=""
		End case 
		
	: ($attribute=wk list style type:K81:55)
		
		Case of 
			: ($value=wk none:K81:91)
				$0:=Get localized string:C991("None")
			: ($value=wk disc:K81:140)
				$0:=Get localized string:C991("Disc")
			: ($value=wk circle:K81:141)
				$0:=Get localized string:C991("Circle")
			: ($value=wk square:K81:142)
				$0:=Get localized string:C991("Square")
			: ($value=wk hollow square:K81:155)
				$0:=Get localized string:C991("HollowSquare")
			: ($value=wk diamond:K81:156)
				$0:=Get localized string:C991("Diamond")
			: ($value=wk club:K81:157)
				$0:=Get localized string:C991("Club")
			: ($value=wk decimal:K81:126)
				$0:=Get localized string:C991("123")
			: ($value=wk decimal leading zero:K81:143)
				$0:=Get localized string:C991("010203")
			: ($value=wk lower latin:K81:144)
				$0:=Get localized string:C991("abcLow")
			: ($value=wk upper latin:K81:146)
				$0:=Get localized string:C991("abcCAP")
			: ($value=wk upper roman:K81:147)
				$0:=Get localized string:C991("Roman")
			Else 
				$0:=""
		End case 
		
	Else 
		
		$0:=""
		
End case 


















