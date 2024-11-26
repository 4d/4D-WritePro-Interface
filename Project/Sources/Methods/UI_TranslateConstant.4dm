//%attributes = {"invisible":true}
#DECLARE($attribute : Text; $value : Integer)->$result : Text

Case of 
	: ($Attribute=wk text underline style:K81:73) | ($Attribute=wk text linethrough style:K81:75)
		
		Case of 
			: ($value=wk none:K81:91)
				$result:=Localized string:C991("None")
			: ($value=wk solid:K81:115)
				$result:=Localized string:C991("Solid")
			: ($value=wk dotted:K81:116)
				$result:=Localized string:C991("Dotted")
			: ($value=wk dashed:K81:117)
				$result:=Localized string:C991("Dashed")
			: ($value=wk double:K81:118)
				$result:=Localized string:C991("Double")
			: ($value=wk semi transparent:K81:119)
				$result:=Localized string:C991("Semi")
			: ($value=wk word:K81:120)
				$result:=Localized string:C991("Word")
		End case 
		
	: ($attribute=wk text transform:K81:70)
		
		Case of 
			: ($value=wk none:K81:91)
				$result:=Localized string:C991("TextTransformNone")
			: ($value=wk capitalize:K81:163)
				$result:=Localized string:C991("Capitalize")
			: ($value=wk lowercase:K81:121)
				$result:=Localized string:C991("Lowercase")
			: ($value=wk uppercase:K81:122)
				$result:=Localized string:C991("Uppercase")
			: ($value=wk small uppercase:K81:123)
				$result:=Localized string:C991("SmallUppercase")
		End case 
		
	: ($attribute=wk text align:K81:49)
		
		Case of 
			: ($value=wk default:K81:160)
				$result:=Localized string:C991("ssAlignDefault")
			: ($value=wk left:K81:95)
				$result:=Localized string:C991("ssAlignLeft")
			: ($value=wk center:K81:99)
				$result:=Localized string:C991("ssAlignCenter")
			: ($value=wk right:K81:96)
				$result:=Localized string:C991("ssAlignRight")
			: ($value=wk justify:K81:100)
				$result:=Localized string:C991("ssAlignJustified")
		End case 
		
	: ($attribute=wk vertical align:K81:9)
		Case of 
			: ($value=wk default:K81:160)
				$result:=Localized string:C991("ssAlignDefault")
			: ($value=wk baseline:K81:102)
				$result:=Localized string:C991("ssAlignBase")
			: ($value=wk top:K81:97)
				$result:=Localized string:C991("ssAlignTop")
			: ($value=wk middle:K81:101)
				$result:=Localized string:C991("ssAlignMiddle")
			: ($value=wk bottom:K81:98)
				$result:=Localized string:C991("ssAlignBottom")
			: ($value=wk superscript:K81:103)
				$result:=Localized string:C991("ssAlignSuperscript")
			: ($value=wk subscript:K81:104)
				$result:=Localized string:C991("ssAlignSubscript")
			Else 
				$result:="-"
		End case 
		
		
	: ($attribute=wk border style:K81:29) | ($attribute=wk border style top:K81:32) | ($attribute=wk border style bottom:K81:33) | ($attribute=wk border style left:K81:30) | ($attribute=wk border style right:K81:31)
		
		Case of 
			: ($value=wk none:K81:91)
				$result:=Localized string:C991("None")
			: ($value=wk hidden:K81:128)
				$result:=Localized string:C991("Hidden")
			: ($value=wk solid:K81:115)
				$result:=Localized string:C991("Solid")
			: ($value=wk dotted:K81:116)
				$result:=Localized string:C991("Dotted")
			: ($value=wk dashed:K81:117)
				$result:=Localized string:C991("Dashed")
			: ($value=wk double:K81:118)
				$result:=Localized string:C991("Double")
			: ($value=wk groove:K81:129)
				$result:=Localized string:C991("Groove")
			: ($value=wk ridge:K81:130)
				$result:=Localized string:C991("Ridge")
			: ($value=wk inset:K81:131)
				$result:=Localized string:C991("Inset")
			: ($value=wk outset:K81:132)
				$result:=Localized string:C991("Outset")
			Else 
				$result:=""
		End case 
		
	: ($attribute=wk list style type:K81:55)
		
		Case of 
			: ($value=wk none:K81:91)
				$result:=Localized string:C991("None")
			: ($value=wk disc:K81:140)
				$result:=Localized string:C991("Disc")
			: ($value=wk circle:K81:141)
				$result:=Localized string:C991("Circle")
			: ($value=wk square:K81:142)
				$result:=Localized string:C991("Square")
			: ($value=wk hollow square:K81:155)
				$result:=Localized string:C991("HollowSquare")
			: ($value=wk diamond:K81:156)
				$result:=Localized string:C991("Diamond")
			: ($value=wk club:K81:157)
				$result:=Localized string:C991("Club")
			: ($value=wk decimal:K81:126)
				$result:=Localized string:C991("123")
			: ($value=wk decimal leading zero:K81:143)
				$result:=Localized string:C991("010203")
			: ($value=wk lower latin:K81:144)
				$result:=Localized string:C991("abcLow")
			: ($value=wk upper latin:K81:146)
				$result:=Localized string:C991("abcCAP")
			: ($value=wk upper roman:K81:147)
				$result:=Localized string:C991("Roman")
			Else 
				$result:=""
		End case 
		
	Else 
		
		$result:=""
		
End case 


















