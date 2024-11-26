//%attributes = {"invisible":true}
var $o; $wp : Object
var $i : Integer

ARRAY TEXT:C222(WP_fontFamilly; 0)
ARRAY TEXT:C222(WP_fontFamillyJapanese; 0)
ARRAY TEXT:C222(WP_fontStyle; 0)
ARRAY TEXT:C222(WP_fontLongName; 0)

FONT LIST:C460(WP_FontFamilly)  // no enough for japaneese, check below

$o:=System info:C1571
If ($o.osLanguage="ja")
	
	ARRAY TEXT:C222(WP_fontFamillyJapanese; Size of array:C274(WP_fontFamilly))
	
	$wp:=WP New:C1317
	For ($i; 1; Size of array:C274(WP_fontFamilly))
		WP SET ATTRIBUTES:C1342($wp; wk font family:K81:65; WP_fontFamilly{$i})
		WP Get attributes:C1345($wp; wk font family:K81:65; WP_fontFamillyJapanese{$i})
	End for 
	
End if 





