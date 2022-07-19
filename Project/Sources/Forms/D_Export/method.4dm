
var $x1; $y1; $x2; $y1; $height : Integer
var $limit : Text
var $userPref : cs:C1710.preferences

Case of 
	: (FORM Event:C1606.code=On Load:K2:1)
		
		
		If (FORM Get color scheme:C1761="dark")
			OBJECT SET RGB COLORS:C628(*; "BackgroundA@"; "#141414"; "#141414")  // very dark grey
			OBJECT SET RGB COLORS:C628(*; "BackgroundB@"; "#282828"; "#282828")  // a bit less dark grey
		End if 
		
		GOTO OBJECT:C206(*; "")
		SET WINDOW TITLE:C213(Form:C1466.extra.windowTitle)
		
		Form:C1466.local:=New object:C1471
		
		Form:C1466.local.pref:=cs:C1710.preferences.new().user("4DWInterface.preferences")
		Form:C1466.local.pref.sefDefault(New object:C1471("recomputeFormulas"; True:C214))
		
		// based on user preferences
		Form:C1466.recomputeFormulas:=Form:C1466.local.pref.get("recomputeFormulas")
		
		//$pref.set("date"; Current date)
		//$date:=$pref.get("date")
		
		//$options.typeExport:="pdf"
		
		// to be removed during on Unload
		Form:C1466.local.tipDelay:=Get database parameter:C643(Tips delay:K37:80)
		Form:C1466.local.tipDuration:=Get database parameter:C643(Tips duration:K37:81)
		SET DATABASE PARAMETER:C642(Tips delay:K37:80; 1)
		SET DATABASE PARAMETER:C642(Tips duration:K37:81; 10*60)  // 5 seconds
		
		
		If (Not:C34(Undefined:C82((Form:C1466[wk optimized for:K81:317]))))
			If (Form:C1466[wk optimized for:K81:317]=wk screen:K81:319)
				Form:C1466.local.rbScreen:=1
				Form:C1466.local.rbPrint:=0
			Else   //"print"
				Form:C1466.local.rbScreen:=0
				Form:C1466.local.rbPrint:=1
			End if 
		End if 
		
		//page 3  pages all or from…To
		Form:C1466.local.rbPagesAll:=1
		Form:C1466.local.rbPagesFromTo:=0
		
		Form:C1466.local.MemopageIndexTo:=Form:C1466.pageIndexTo
		
		Case of 
			: (Form:C1466.extra.extension="txt") | (Form:C1466.extra.extension="docx")
				$limit:="Limit_P0"
				FORM GOTO PAGE:C247(1)
				
				OBJECT SET VISIBLE:C603(*; "lblOptimized"; False:C215)
				OBJECT SET VISIBLE:C603(*; "rbScreen"; False:C215)
				OBJECT SET VISIBLE:C603(*; "rbPrint"; False:C215)
				
				If (Form:C1466.extra.extension="txt")
					OBJECT SET VISIBLE:C603(*; "cbVisibleEmptyImages"; False:C215)
				End if 
				
				
			: (Form:C1466.extra.extension="html") | (Form:C1466.extra.extension="mht")
				$limit:="Limit_P1"
				FORM GOTO PAGE:C247(2)
				
			: (Form:C1466.extra.extension="pdf")
				$limit:="Limit_P2"
				FORM GOTO PAGE:C247(3)
				
			: (Form:C1466.extra.extension="svg")
				$limit:="Limit_P3"
				FORM GOTO PAGE:C247(4)
				
				If (Form:C1466.embeddedPictures=True:C214)
					Form:C1466.local.rbEmbedPictures:=1
					Form:C1466.local.rbExportPictures:=0
				Else 
					Form:C1466.local.rbEmbedPictures:=0
					Form:C1466.local.rbExportPictures:=1
				End if 
				
		End case 
		
		OBJECT GET COORDINATES:C663(*; $limit; $x1; $y1; $x2; $y2)
		$height:=$y2
		GET WINDOW RECT:C443($x1; $y1; $x2; $y2)
		SET WINDOW RECT:C444($x1; $y1; $x2; $y1+$height)
		
		
	: (FORM Event:C1606.code=On Unload:K2:2)
		
		//back to original settings
		SET DATABASE PARAMETER:C642(Tips delay:K37:80; Form:C1466.local.tipDelay)
		SET DATABASE PARAMETER:C642(Tips duration:K37:81; Form:C1466.local.tipDuration)
		
		// save preferences
		
		Form:C1466.local.pref.set("recomputeFormulas"; Form:C1466.recomputeFormulas)
		Form:C1466.local.pref.save()
		
		OB REMOVE:C1226(Form:C1466; "local")
End case 