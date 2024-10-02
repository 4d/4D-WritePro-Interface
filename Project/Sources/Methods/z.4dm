//%attributes = {}
var $thems : Object
var $them : Object
var $json : Text
var $file : 4D:C1709.File

////$d:=Chaîne(Date du jour; Système date court)
////$h:=Chaîne(Heure courante; Système heure court)



//var $doc : cs.WPdocument
//var $section1a; $section1b : cs.WPsection
//var $textRange : cs.WPrange
//var $range : cs.WPrange

//var $header; $footer : cs.WPelement
//var $textBox : cs.WPelement


//var $text : Text


//$doc:=cs.WPdocument.new()



//$doc.setText("blablabla"; wk append)
//$text:=$doc.getText()

//$range:=$doc.textRange(1; 3)


//$section1a:=cs.WPsection.new($doc.document; 1)
//$section1b:=cs.WPsection.new($range.range)


//$header:=$section1b.newHeader()
//$footer:=$section1b.newFooter()

//$textBox:=$doc.newTextBox()

//$textBox.delete()


//aiPref:=New object
//aiPref.apiKey:="xxx"
//$json:=JSON Stringify(aiPref; *)
//$file:=File(Folder(fk resources folder).path+"aiPref.json")

//$file.setText($json)



$thems:=New object:C1471

$thems.chatThems:=New collection:C1472


$them:=New object:C1471
$them.title:="The world\\motors show"
$them.icon:="cars.png"
$them.prompt:="Generate a formal invitation for the ”World Motor Show” 2025"
$thems.chatThems.push($them)

$them:=New object:C1471
$them.title:="Wedding\\invitation"
$them.icon:="wedding.png"
$them.prompt:="Generate a funny invitation for the wedding of PAUL and VIRGINIE"
$thems.chatThems.push($them)

$them:=New object:C1471
$them.title:="Hi-Tech\\Show"
$them.icon:="hiTech.png"
$them.prompt:="Generate geek invitation for the hi-tech show 2025"
$thems.chatThems.push($them)

$them:=New object:C1471
$them.title:="Lawyers\\congress"
$them.icon:="lawyers.png"
$them.prompt:="Generate a formal invitation for lawyers congress of Chicago"
$thems.chatThems.push($them)

$them:=New object:C1471
$them.title:="DIY\\Store opening"
$them.icon:="DIY.png"
$them.prompt:="Generates an invitation to the opening of the “Maxi-DYI\\” store."
$thems.chatThems.push($them)

$them:=New object:C1471
$them.title:="Gardening\\skills"
$them.icon:="garden.png"
$them.prompt:="Generate an advertising for the new book “Have fun gardening"
$thems.chatThems.push($them)


$json:=JSON Stringify:C1217($thems; *)
$file:=File:C1566(Folder:C1567(fk resources folder:K87:11).path+"aiThems.json")

$file.setText($json)





