var $file : 4D:C1709.File

Case of 
	: (Form event code:C388=On Load:K2:1) || (Form:C1466.reset=True:C214)
		
		Form:C1466.reset:=False:C215
		
		Form:C1466._extra:={}
		Form:C1466._extra.expanded:=True:C214
		
		Form:C1466.prompt:="Je souhaite un descriptif sommaire de la tour Eiffel"
		
		Form:C1466.bookmarks:=[]
		
		$file:=File:C1566("/RESOURCES/4DWP_AI/templateAI.4wp")
		Form:C1466.WPai:=WP Import document:C1318($file)
		WP SET ATTRIBUTES:C1342(Form:C1466.WPai; wk background color:K81:20; wk transparent:K81:134)
		
		SET TIMER:C645(0)
		
	: (Form event code:C388=On Timer:K2:25)
		SET TIMER:C645(0)
		
End case 

