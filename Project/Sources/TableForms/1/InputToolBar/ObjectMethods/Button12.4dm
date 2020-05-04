  //C_COLLECTION($_attributes)
  //C_OBJECT($range)

  //$range:=WP Selection range([SAMPLE]WP)

  //If ($range.type=2)  // anchored picture

  //$_attributes:=New collection
  //$_attributes.push(wk height)
  //$_attributes.push(wk width)
  //$_attributes.push(wk min height)
  //$_attributes.push(wk min width)
  //$_attributes.push(wk anchor horizontal align)
  //$_attributes.push(wk anchor vertical align)
  //$_attributes.push(wk anchor horizontal offset)
  //$_attributes.push(wk anchor vertical offset)
  //$_attributes.push(wk margin)
  //$_attributes.push(wk padding)
  //$_attributes.push(wk image url)
  //$_attributes.push(wk image alternate text)

  //$param:=New object

  //For each ($attribute;$_attributes)
  //$param[$attribute]:=$range[$attribute]
  //End for each 

  //$form:=Open form window("D_AnchoredPicture";Palette form window;Horizontally centered;Vertically centered)
  //DIALOG("D_AnchoredPicture";$param)

  //If (ok=1)
  //For each ($attribute;$_attributes)
  //$range[$attribute]:=$param[$attribute]
  //End for each 
  //End if 

  //End if 
