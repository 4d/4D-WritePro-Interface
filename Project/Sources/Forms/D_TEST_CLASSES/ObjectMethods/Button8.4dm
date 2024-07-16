
var $area : cs:C1710.WPdocument
var $textBox : cs:C1710.WPelement

$area:=cs:C1710.WPdocument.new()



$textBox:=$area.newTextBox(1)

$textBox.setAttributes({width: "5cm"; height: "3cm"; marginLeft: "4cm"; marginTop: "3cm"})

$textBox.setText("Hey, I am a text box!")


Form:C1466.wp:=$area.document

//ALERT($textBox.getText())
