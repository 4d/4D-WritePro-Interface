//%attributes = {"invisible":true}
C_TEXT:C284($1; $shiftMode)

// shift right

C_REAL:C285($leftMargin; $rightMargin; $pageWidth; $pageHeight; $pageLeftMargin; $pageRightMargin; $shift)
C_LONGINT:C283($orientation; $direction)
C_TEXT:C284($unit)
C_OBJECT:C1216($paragraph; $section)
C_COLLECTION:C1488($_paragraphs)

$shiftMode:=$1

WP GET ATTRIBUTES:C1345(Form:C1466.selection; wk layout unit:K81:78; $unit)
Case of 
	: ($unit="cm")
		$shift:=1
	: ($unit="mm")
		$shift:=10
	: ($unit="in")
		$shift:=0.25
	: ($unit="pt")
		$shift:=20
End case 

$paragraph:=WP Paragraph range:C1346(Form:C1466.selection)
WP GET ATTRIBUTES:C1345($paragraph; wk margin left:K81:11; $leftMargin; wk margin right:K81:12; $rightMargin)

If ($leftMargin=wk mixed:K81:89) | ($rightMargin=wk mixed:K81:89)
	$_paragraphs:=WP Get elements:C1550(Form:C1466.selection; wk type paragraph:K81:191)  // collection of paragraph elements
Else 
	$_paragraphs:=New collection:C1472($paragraph)  // paragraph range
End if 

For each ($paragraph; $_paragraphs)
	
	WP GET ATTRIBUTES:C1345($paragraph; wk margin left:K81:11; $leftMargin; wk margin right:K81:12; $rightMargin; wk direction:K81:50; $direction)
	
	$section:=WP Get section:C1581($paragraph)
	WP GET ATTRIBUTES:C1345($section; \
		wk page width:K81:262; $pageWidth; \
		wk page height:K81:263; $pageHeight; \
		wk page orientation:K81:264; $orientation; \
		wk page margin left:K81:266; $pageLeftMargin; \
		wk page margin right:K81:267; $pageRightMargin)
	If ($orientation=1)
		$pageWidth:=$pageHeight
	End if 
	$pageWidth:=$pageWidth-($pageRightMargin+$pageLeftMargin)
	
	
	Case of 
		: ($shiftMode="left") & ($direction=wk left to right:K81:124)
			
			$leftMargin:=$leftMargin-$shift
			If ($leftMargin<0)
				$leftMargin:=0
			End if 
			WP SET ATTRIBUTES:C1342($paragraph; wk margin left:K81:11; $leftMargin)
			
		: ($shiftMode="right") & ($direction=wk left to right:K81:124)
			
			$leftMargin:=$leftMargin+$shift
			If ($leftMargin<($pageWidth-$rightMargin))
				WP SET ATTRIBUTES:C1342($paragraph; wk margin left:K81:11; $leftMargin)
			End if 
			
		: ($shiftMode="left") & ($direction=wk right to left:K81:125)
			
			$rightMargin:=$rightMargin+$shift
			If ($rightMargin<($pageWidth-$leftMargin))
				WP SET ATTRIBUTES:C1342($paragraph; wk margin right:K81:12; $rightMargin)
			End if 
			
		: ($shiftMode="right") & ($direction=wk right to left:K81:125)
			
			$rightMargin:=$rightMargin-$shift
			If ($rightMargin<0)
				$rightMargin:=0
			End if 
			WP SET ATTRIBUTES:C1342($paragraph; wk margin right:K81:12; $rightMargin)
			
	End case 
	
	
	
	
End for each 
