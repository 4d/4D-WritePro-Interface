C_OBJECT:C1216($styleSheet;$sampleRange)
C_LONGINT:C283(_StylesheetTabs)
C_TEXT:C284($category)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		$styleSheet:=Form:C1466.stylesheet
		
		  //ARRAY TEXT(_StylesheetTabs;0)
		
		  //APPEND TO ARRAY(_StylesheetTabs;Get localized string("ssFonts"))
		  //APPEND TO ARRAY(_StylesheetTabs;Get localized string("ssParagraphs"))
		  //APPEND TO ARRAY(_StylesheetTabs;Get localized string("ssMarginsBorders"))
		
		_StylesheetTabs:=New list:C375
		APPEND TO LIST:C376(_StylesheetTabs;Get localized string:C991("ssFonts");1)
		APPEND TO LIST:C376(_StylesheetTabs;Get localized string:C991("ssParagraphs");2)
		APPEND TO LIST:C376(_StylesheetTabs;Get localized string:C991("ssMarginsBorders");3)
		
		If (Form:C1466.stylesheet.type=wk type default:K81:190)
			SET LIST ITEM PROPERTIES:C386(_StylesheetTabs;2;False:C215;Plain:K14:1;0)
			SET LIST ITEM PROPERTIES:C386(_StylesheetTabs;3;False:C215;Plain:K14:1;0)
		End if 
		
		wpStyleSample:=WP New:C1317
		WP SET TEXT:C1574(wpStyleSample;"Alpha Bravo";wk replace:K81:177)
		WP SELECT:C1348(*;"StyleSample";wk start text:K81:165;wk end text:K81:164)
		$sampleRange:=WP Selection range:C1340(*;"StyleSample")
		
		
		Form:C1466.tabs:=New object:C1471
		
		  //Form.tabs.fonts:=New collection
		  //Form.tabs.paragraphs:=New collection
		  //Form.tabs.margins:=New collection
		
		Form:C1466.tabs.fonts:=WP_GetStyleAttributesByGroup ("Fonts")
		Form:C1466.tabs.paragraphs:=WP_GetStyleAttributesByGroup ("Paragraphs")
		Form:C1466.tabs.margins:=WP_GetStyleAttributesByGroup ("Margins")
		
		
		
		SET TIMER:C645(1)
		
		If ($styleSheet.name="Normal")
			
			OBJECT SET ENTERABLE:C238(*;"stylesheetName";False:C215)
			OBJECT SET RGB COLORS:C628(*;"stylesheetName";0x00808080;"transparent")
			OBJECT SET FONT STYLE:C166(*;"stylesheetName";Bold:K14:2)
			OBJECT SET BORDER STYLE:C1262(*;"stylesheetName";Border None:K42:27)
			
			OBJECT SET ENTERABLE:C238(*;"colCheck";False:C215)
			
			  //OBJECT SET RGB COLORS(*;"colLabel";0x00808080;0x00202020)
			OBJECT SET VISIBLE:C603(*;"colNormal";False:C215)
			  //OBJECT SET VISIBLE(*;"colCheck";False)
			OBJECT SET VISIBLE:C603(*;"verticalSeparator";False:C215)
			OBJECT SET VISIBLE:C603(*;"HorizontallSeparator";False:C215)
			OBJECT SET VISIBLE:C603(*;"labelNormal";False:C215)
			OBJECT SET VISIBLE:C603(*;"labelForced";False:C215)
			
		End if 
		
		
		WP_StyleFillEditLB (1)
		WP_StyleFillEditLB (2)
		WP_StyleFillEditLB (3)
		
		
	: (Form event code:C388=On Timer:K2:25)
		
		SET TIMER:C645(0)
		
		GET LIST ITEM:C378(_StylesheetTabs;*;$page;$text)
		$category:=Choose:C955($page;"bug";"fonts";"paragraphs";"margins")
		Form:C1466.edit:=Form:C1466.tabs[$category]
		
		StyleSheetBuildSample 
		
	: (Form event code:C388=On Unload:K2:2)
		
		CLEAR LIST:C377(_StylesheetTabs)
		
End case 
