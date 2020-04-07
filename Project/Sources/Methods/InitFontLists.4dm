//%attributes = {"invisible":true}
C_OBJECT:C1216($o;$wp)
C_LONGINT:C283($i)


ARRAY TEXT:C222(WP_fontFamilly;0)
ARRAY TEXT:C222(WP_fontFamillyJapanese;0)
ARRAY TEXT:C222(WP_fontStyle;0)
ARRAY TEXT:C222(WP_fontLongName;0)

FONT LIST:C460(WP_FontFamilly)  // no enough for japaneese, check below

$o:=Get system info:C1571
If ($o.osLanguage="ja")
	
	ARRAY TEXT:C222(WP_fontFamillyJapanese;Size of array:C274(WP_fontFamilly))
	
	$wp:=WP New:C1317
	For ($i;1;Size of array:C274(WP_fontFamilly))
		WP SET ATTRIBUTES:C1342($wp;wk font family:K81:65;WP_fontFamilly{$i})
		WP GET ATTRIBUTES:C1345($wp;wk font family:K81:65;WP_fontFamillyJapanese{$i})
	End for 
	
End if 
