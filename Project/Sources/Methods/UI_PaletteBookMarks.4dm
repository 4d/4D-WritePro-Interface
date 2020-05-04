//%attributes = {"invisible":true}
C_POINTER:C301($ptr;$ptrFontColor)
C_LONGINT:C283($i;$n;$p)
C_TEXT:C284($tip)
C_LONGINT:C283($typeSelection)

If (UI_isProtected (False:C215))  // false means don't take focus into account
	
	OBJECT SET ENABLED:C1123(*;"@";False:C215)
	OBJECT SET ENTERABLE:C238(*;"@";False:C215)
	
Else 
	
	$typeSelection:=Form:C1466.selection.type
	
	Case of 
			
		: ($typeSelection=2)  // static picture
			OBJECT SET ENABLED:C1123(*;"@";False:C215)
			OBJECT SET ENTERABLE:C238(*;"@";False:C215)
			
		: ($typeSelection=0)
			OBJECT SET ENABLED:C1123(*;"@";True:C214)
			OBJECT SET ENTERABLE:C238(*;"@";True:C214)
			
			$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"LB_Bookmarks")
			$p:=Find in array:C230($ptr->;True:C214)
			If ($p>0)
				OBJECT SET ENABLED:C1123(*;"btnRemove";True:C214)
				OBJECT SET ENABLED:C1123(*;"btnReload";True:C214)
				
				$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"lb_bookmarkNames")
				
				$tip:=Get localized string:C991("tipDeleteBookmark")
				$tip:=Replace string:C233($tip;"[1]";$ptr->{$p})  // $bookmarkName might be ""
				OBJECT SET HELP TIP:C1181(*;"btnRemove";$tip)
				
				$tip:=Get localized string:C991("tipRedefineBookmark")
				$tip:=Replace string:C233($tip;"[1]";$ptr->{$p})  // $bookmarkName might be ""
				OBJECT SET HELP TIP:C1181(*;"btnReload";$tip)
				
			Else 
				
				OBJECT SET ENABLED:C1123(*;"btnRemove";False:C215)
				OBJECT SET ENABLED:C1123(*;"btnReload";False:C215)
				
				OBJECT SET HELP TIP:C1181(*;"btnRemove";"")
				OBJECT SET HELP TIP:C1181(*;"btnReload";"")
			End if 
			
			
			$ptrFontColor:=LISTBOX Get array:C1278(*;"LB_Bookmarks";lk font color array:K53:27)
			If (Not:C34(Is nil pointer:C315($ptrFontColor)))
				$n:=Size of array:C274($ptrFontColor->)
				For ($i;1;$n)
					$ptrFontColor->{$i}:=skinFontColor
				End for 
			Else 
				OBJECT SET RGB COLORS:C628(*;"LB_Bookmarks";skinFontColor;Background color none:K23:10)
			End if 
			
	End case 
	
End if 