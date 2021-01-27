
  //OBJECT SET ENTERABLE(*;"WParea";Shift down)
  //WP UpdateWidget ("WPwidget";"WParea")


  //$_tables:=WP Get elements(WP Get body([SAMPLE]WP);wk type table)

  //$width1:=0.1
  //$width2:=0.2

  //For each ($table;$_tables)

  //$width1_s:=String($width1;"&xml")+"pt"
  //$width2_s:=String($width2;"&xml")+"pt"

  //$cells:=WP Table get cells($table;1;1;$table[wk column count];$table[wk row count])
  //WP SET ATTRIBUTES($cells;wk border style;wk solid;wk border width;$width1_s;wk border color;"blue")
  //WP SET ATTRIBUTES($table;wk border style;wk solid;wk border width;$width2_s;wk border color;"red")

  //$width1:=$width1+0.1
  //$width2:=$width2+0.1

  //End for each 



  //PRINT SETTINGS
  //WP PRINT([SAMPLE]WP)