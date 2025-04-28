//%attributes = {}

#DECLARE($action : Text)->$meta : Object

var $format; $text; $helpTip; $color : Text

If (Count parameters:C259=0)
	$action:="timer"
End if 

Case of 
	: ($action="timer")
		
		//$format:=OBJECT Get format(*; "btn_launch")
		
		$format:=";path:/RESOURCES/Images/AI/PICT"
		
		OBJECT SET VISIBLE:C603(*; "spinner"; False:C215)
		OBJECT SET VISIBLE:C603(*; "wait@"; False:C215)
		
		Case of 
			: (Form:C1466._extra.state=0)  //"run")
				$format:=Replace string:C233($format; "PICT"; "send_32.png")
				$helpTip:=Localized string:C991("SendRequest")
				
			: (Form:C1466._extra.state=1)  //"running"
				OBJECT SET VISIBLE:C603(*; "spinner"; True:C214)
				$format:=Replace string:C233($format; "PICT"; "send_32.png")
				$helpTip:=""
				
			: (Form:C1466._extra.state=2)  //"re-run"
				$format:=Replace string:C233($format; "PICT"; "resend_32.png")
				$helpTip:=Localized string:C991("ResendRequest")
		End case 
		
		OBJECT SET VISIBLE:C603(*; "btn_launch"; (Form:C1466._extra.state#1))
		OBJECT SET ENABLED:C1123(*; "btnClear"; (Form:C1466._extra.state#1))  // do NOT enable "clear history" while running
		OBJECT SET FORMAT:C236(*; "btn_launch"; $format)
		
		OBJECT SET HELP TIP:C1181(*; "btn_launch"; $helpTip)
		OBJECT SET ENABLED:C1123(*; "btn_launch"; (Form:C1466._extra.state>=0))  // -1 mean no text in the prompt
		
		
		//*****  return buttons 
		
		
		$text:=WP Get text:C1575(WP Selection range:C1340(*; "WParea"))
		
		OBJECT SET ENABLED:C1123(*; "btn_InsertAsText"; ($text#""))
		OBJECT SET ENABLED:C1123(*; "btn_InsertAsStyledText"; ($text#""))
		OBJECT SET ENABLED:C1123(*; "btn_ClipboardAsText"; ($text#""))
		OBJECT SET ENABLED:C1123(*; "btn_ClipboardAsStyledText"; ($text#""))
		
	: ($action="meta")
		
		$meta:=New object:C1471
		
		If (FORM Get color scheme:C1761="dark")
			If (This:C1470.id=Form:C1466.selectedRow.id)
				$meta.stroke:="White"
				$meta.fontWeight:="bold"
			Else 
				$meta.stroke:="LightGrey"
				$meta.fontWeight:="normal"
			End if 
		Else 
			If (This:C1470.id=Form:C1466.selectedRow.id)
				$meta.stroke:="black"
				$meta.fontWeight:="bold"
			Else 
				$meta.stroke:="Grey"
				$meta.fontWeight:="normal"
			End if 
		End if 
		
		$meta.fill:="transparent"
End case 


//WP Get attributes(Form.WPai; wk layout unit; $unit)
//WP SET ATTRIBUTES(Form.WPai; wk layout unit; "px")

////WP SELECT(*; "WParea"; wk end text; wk end text)
//$currentRange:=WP Selection range(*; "WParea")

//$o:=WP Get position($currentRange; wk 4D Write Pro layout)

//OBJECT SET VISIBLE(*; "spinner"; True)
//OBJECT SET COORDINATES(*; "spinner"; $o.bounds.left+20; $o.bounds.top+60; $o.bounds.left+20+30; $o.bounds.top+60+30)

//WP SET ATTRIBUTES(Form.WPai; wk layout unit; $unit)

