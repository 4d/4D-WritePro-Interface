  //C_OBJECT($range)
  //$range:=WP Text range([SAMPLE]WP;1;5)
  //If (Shift down)
  //WP SET ATTRIBUTES($range;wk font bold;wk true)
  //Else 
  //WP SET ATTRIBUTES($range;wk font bold;wk false)
  //End if 

  //WP UpdateWidget ("WPwidget")

  //C_LONGINT($protection)

  //$sel:=WP Selection range(*;"WParea")
  //WP GET ATTRIBUTES($sel;wk protected;$protection)  //0

  //$Fds:=WP Get style sheet([SAMPLE]WP;"green")
  //WP SET ATTRIBUTES($sel;wk style sheet;$Fds)

  //WP GET ATTRIBUTES($sel;wk protected;$protection)  //1

