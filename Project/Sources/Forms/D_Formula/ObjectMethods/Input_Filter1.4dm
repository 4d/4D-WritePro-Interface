var $keywords : Collection
var $i; $n : Integer

Form:C1466.wizard.formulaUI("resetlist")

Form:C1466.local.filter:=Get edited text:C655
If (Form:C1466.local.filter#"")
	
	Form:C1466.displayedHList.expandAll()
	
	$keywords:=Split string:C1554(Form:C1466.local.filter; " ")
	Form:C1466.displayedHList.filter($keywords)
	
	$n:=Form:C1466.displayedHList.countItems()
	If ($n>0)
		// select the first one which is NOT a sublist parent
		For ($i; 1; $n)
			GET LIST ITEM:C378(Form:C1466.displayedHList.hlist; $i; itemRef; itemText; sublist; expanded)
			If (sublist=0)
				SELECT LIST ITEMS BY POSITION:C381(Form:C1466.displayedHList.hlist; $i)
				Form:C1466.wizard.formulaUI("listUpdated"; $i)
				$i:=$n
			End if 
		End for 
	End if 
End if 

Form:C1466.wizard.formulaUI("cleanup")