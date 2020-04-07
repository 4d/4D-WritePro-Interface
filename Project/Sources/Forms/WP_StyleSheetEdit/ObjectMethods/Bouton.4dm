
StyleSheetBuildSample 

  //WP_StyleFillEditLB 



  //  // Apply on sample
  //$type:=Value type($styleSheet[$item.property])

  //Case of 
  //: ($type=Is text)
  //If ($styleSheet[$item.property]#"")
  //WP SET ATTRIBUTES($sampleRange;$item.property;$styleSheet[$item.property])
  //End if 

  //: ($type=Is real)
  //If ($styleSheet[$item.property]#wk mixed)
  //WP SET ATTRIBUTES($sampleRange;$item.property;$styleSheet[$item.property])
  //End if 
  //End case 
