//%attributes = {"invisible":true}

var $pictureElement; $range : Object

$range:=Form:C1466.range
$pictureElement:=Form:C1466.picture

If ($pictureElement#Null:C1517)
	
	WP SET ATTRIBUTES:C1342($pictureElement; \
		wk margin top:K81:13; Form:C1466.pictSettings[wk margin top:K81:13]; \
		wk margin left:K81:11; Form:C1466.pictSettings[wk margin left:K81:11]; \
		wk margin right:K81:12; Form:C1466.pictSettings[wk margin right:K81:12]; \
		wk margin bottom:K81:14; Form:C1466.pictSettings[wk margin bottom:K81:14]; \
		wk padding top:K81:18; Form:C1466.pictSettings[wk padding top:K81:18]; \
		wk padding left:K81:16; Form:C1466.pictSettings[wk padding left:K81:16]; \
		wk padding right:K81:17; Form:C1466.pictSettings[wk padding right:K81:17]; \
		wk padding bottom:K81:19; Form:C1466.pictSettings[wk padding bottom:K81:19]; \
		wk border color top:K81:37; Form:C1466.pictSettings[wk border color top:K81:37]; \
		wk border color left:K81:35; Form:C1466.pictSettings[wk border color left:K81:35]; \
		wk border color bottom:K81:38; Form:C1466.pictSettings[wk border color bottom:K81:38]; \
		wk border color right:K81:36; Form:C1466.pictSettings[wk border color right:K81:36]; \
		wk border style top:K81:32; Form:C1466.pictSettings[wk border style top:K81:32]; \
		wk border style left:K81:30; Form:C1466.pictSettings[wk border style left:K81:30]; \
		wk border style bottom:K81:33; Form:C1466.pictSettings[wk border style bottom:K81:33]; \
		wk border style right:K81:31; Form:C1466.pictSettings[wk border style right:K81:31]; \
		wk border width top:K81:42; Form:C1466.pictSettings[wk border width top:K81:42]; \
		wk border width left:K81:40; Form:C1466.pictSettings[wk border width left:K81:40]; \
		wk border width bottom:K81:43; Form:C1466.pictSettings[wk border width bottom:K81:43]; \
		wk border width right:K81:41; Form:C1466.pictSettings[wk border width right:K81:41]; \
		wk border radius:K81:44; Form:C1466.pictSettings[wk border radius:K81:44]; \
		wk width:K81:45; Form:C1466.pictSettings[wk width:K81:45]; \
		wk height:K81:46; Form:C1466.pictSettings[wk height:K81:46]; \
		wk image display mode:K81:340; Form:C1466.pictSettings[wk image display mode:K81:340]; \
		wk image alternate text:K81:170; Form:C1466.pictSettings[wk image alternate text:K81:170]\
		)
	
	If (Form:C1466.pictSettings.anchored=True:C214)
		WP SET ATTRIBUTES:C1342(\
			$pictureElement; \
			wk anchor horizontal align:K81:237; Form:C1466.pictSettings[wk anchor horizontal align:K81:237]; \
			wk anchor horizontal offset:K81:236; Form:C1466.pictSettings[wk anchor horizontal offset:K81:236]; \
			wk anchor vertical align:K81:239; Form:C1466.pictSettings[wk anchor vertical align:K81:239]; \
			wk anchor vertical offset:K81:238; Form:C1466.pictSettings[wk anchor vertical offset:K81:238]; \
			wk anchor origin:K81:235; Form:C1466.pictSettings[wk anchor origin:K81:235]; \
			wk anchor layout:K81:227; Form:C1466.pictSettings[wk anchor layout:K81:227]; \
			wk anchor page:K81:231; Form:C1466.pictSettings[wk anchor page:K81:231]; \
			wk anchor section:K81:228; Form:C1466.pictSettings[wk anchor section:K81:228]\
			)
	End if 
	
End if 

