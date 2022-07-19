//%attributes = {"invisible":true}
var $marginTop; $marginLeft; $marginRight; $marginBottom : Real
var $paddingTop; $paddingLeft; $paddingRight; $paddingBottom : Real
var $width; $height : Real
var $URL; $alternateText; $imageDisplayMode : Text

var $borderColorBottom; $borderColorTop; $borderColorLeft; $borderColorRight : Text
var $borderWidthBottom; $borderWidthTop; $borderWidthLeft; $borderWidthRight : Text
var $borderStyleBottom; $borderStyleTop; $borderStyleLeft; $borderStyleRight : Integer
var $borderRadius : Text

var $anchorHorizontalOffset; $anchorVerticalOffset : Real
var $anchorHorizontalAlign; $anchorVerticalAlign : Integer
var $anchorOrigin; $anchorPage; $anchorSection; $anchorLayout : Integer

var $range; $pictureElement; $formula : Object
var $_formulas : Collection


$range:=Form:C1466.range
$pictureElement:=Form:C1466.picture

Form:C1466.pictSettings:=New object:C1471  // real picture settings
Form:C1466.display:=New object:C1471  // used for display only

If (Not:C34(Undefined:C82($pictureElement[wk anchor horizontal align:K81:237])))  //($range.type=2)
	Form:C1466.pictSettings.anchored:=True:C214
Else 
	Form:C1466.pictSettings.anchored:=False:C215
End if 

// common attributes

WP GET ATTRIBUTES:C1345($pictureElement; \
wk margin top:K81:13; $marginTop; \
wk margin left:K81:11; $marginLeft; \
wk margin right:K81:12; $marginRight; \
wk margin bottom:K81:14; $marginBottom; \
wk padding top:K81:18; $paddingTop; \
wk padding left:K81:16; $paddingLeft; \
wk padding right:K81:17; $paddingRight; \
wk padding bottom:K81:19; $paddingBottom; \
wk border color bottom:K81:38; $borderColorBottom; \
wk border color top:K81:37; $borderColorTop; \
wk border color left:K81:35; $borderColorLeft; \
wk border color right:K81:36; $borderColorRight; \
wk border width bottom:K81:43; $borderWidthBottom; \
wk border width top:K81:42; $borderWidthTop; \
wk border width left:K81:40; $borderWidthLeft; \
wk border width right:K81:41; $borderWidthRight; \
wk border style bottom:K81:33; $borderStyleBottom; \
wk border style top:K81:32; $borderStyleTop; \
wk border style left:K81:30; $borderStyleLeft; \
wk border style right:K81:31; $borderStyleRight; \
wk border radius:K81:44; $borderRadius; \
wk width:K81:45; $width; \
wk height:K81:46; $height; \
wk image url:K81:218; $URL; \
wk image alternate text:K81:170; $alternateText; \
wk image display mode:K81:340; $imageDisplayMode)


Form:C1466.pictSettings[wk margin top:K81:13]:=$marginTop
Form:C1466.pictSettings[wk margin left:K81:11]:=$marginLeft
Form:C1466.pictSettings[wk margin bottom:K81:14]:=$marginBottom
Form:C1466.pictSettings[wk margin right:K81:12]:=$marginRight

Form:C1466.pictSettings[wk padding top:K81:18]:=$paddingTop
Form:C1466.pictSettings[wk padding left:K81:16]:=$paddingLeft
Form:C1466.pictSettings[wk padding bottom:K81:19]:=$paddingBottom
Form:C1466.pictSettings[wk padding right:K81:17]:=$paddingRight

Form:C1466.pictSettings[wk border color top:K81:37]:=$borderColorTop
Form:C1466.pictSettings[wk border color left:K81:35]:=$borderColorLeft
Form:C1466.pictSettings[wk border color bottom:K81:38]:=$borderColorBottom
Form:C1466.pictSettings[wk border color right:K81:36]:=$borderColorRight

Form:C1466.pictSettings[wk border style top:K81:32]:=$borderStyleTop
Form:C1466.pictSettings[wk border style left:K81:30]:=$borderStyleLeft
Form:C1466.pictSettings[wk border style bottom:K81:33]:=$borderStyleBottom
Form:C1466.pictSettings[wk border style right:K81:31]:=$borderStyleRight

Form:C1466.pictSettings[wk border width top:K81:42]:=$borderWidthTop
Form:C1466.pictSettings[wk border width left:K81:40]:=$borderWidthLeft
Form:C1466.pictSettings[wk border width bottom:K81:43]:=$borderWidthBottom
Form:C1466.pictSettings[wk border width right:K81:41]:=$borderWidthRight

Form:C1466.pictSettings[wk border radius:K81:44]:=$borderRadius


Form:C1466.pictSettings[wk width:K81:45]:=$width  // might be 0(auto) if formula or URL (see below)
Form:C1466.pictSettings[wk height:K81:46]:=$height  // might be 0(auto) if formula or URL (see below)

Form:C1466.pictSettings[wk image url:K81:218]:=$url
Form:C1466.pictSettings[wk image alternate text:K81:170]:=$alternateText
Form:C1466.pictSettings[wk image display mode:K81:340]:=$imageDisplayMode


// MORE FOR ANCHORED PICTURES

If (Form:C1466.pictSettings.anchored=True:C214)
	
	// extra attributes for anchored pictures
	WP GET ATTRIBUTES:C1345($pictureElement; \
		wk anchor horizontal align:K81:237; $anchorHorizontalAlign; \
		wk anchor horizontal offset:K81:236; $anchorHorizontalOffset; \
		wk anchor vertical align:K81:239; $anchorVerticalAlign; \
		wk anchor vertical offset:K81:238; $anchorVerticalOffset; \
		wk anchor origin:K81:235; $anchorOrigin; \
		wk anchor page:K81:231; $anchorPage; \
		wk anchor section:K81:228; $anchorSection; \
		wk anchor layout:K81:227; $anchorLayout\
		)
	
	Form:C1466.pictSettings[wk anchor horizontal align:K81:237]:=$anchorHorizontalAlign
	Form:C1466.pictSettings[wk anchor horizontal offset:K81:236]:=$anchorHorizontalOffset
	
	Form:C1466.pictSettings[wk anchor vertical align:K81:239]:=$anchorVerticalAlign
	Form:C1466.pictSettings[wk anchor vertical offset:K81:238]:=$anchorVerticalOffset
	
	Form:C1466.pictSettings[wk anchor origin:K81:235]:=$anchorOrigin
	Form:C1466.pictSettings[wk anchor layout:K81:227]:=$anchorLayout
	
	Form:C1466.pictSettings[wk anchor page:K81:231]:=$anchorPage
	Form:C1466.pictSettings[wk anchor section:K81:228]:=$anchorSection
	
End if 


// FORMULA MAY COME FROM AN ATTRIBUTE (If anchored image)
// OR AN INSERTED FORMULA returned inside an inline image  
// (Used to determine the picture ratio)

If (Form:C1466.pictSettings.anchored)
	
	WP GET ATTRIBUTES:C1345($pictureElement; wk image formula:K81:305; $formula)
	
Else 
	
	If ($range#Null:C1517)
		$_formulas:=WP Get formulas:C1702($range)
		If ($_formulas.length>0)
			$formula:=$_formulas[0].formula
		End if 
	End if 
	
End if 
If ($formula#Null:C1517)
	Form:C1466.pictSettings.formula:=$formula  // FORMULA
End if 
