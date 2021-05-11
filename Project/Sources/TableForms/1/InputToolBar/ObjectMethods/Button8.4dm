
  //OBJECT SET ENTERABLE(*;"WParea";Shift down)
  //WP UpdateWidget ("WPwidget";"WParea")


  //$_tables:=WP Get elements(WP Get body([SAMPLE]WP);wk type table)


  //$width1:=New collection("0.05pt";"0.2pt";"0.4pt";"0.6pt";"0.8pt")
  //$width2:=New collection("0.2pt";"0.4pt";"0.6pt";"0.8pt";"1pt")

  //$i:=0
  //For each ($table;$_tables)

  //$cells:=WP Table get cells($table;1;1;$table[wk column count];$table[wk row count])
  //WP SET ATTRIBUTES($cells;wk border style;wk solid;wk border width;$width1[$i];wk border color;"blue")
  //WP SET ATTRIBUTES($table;wk border style;wk solid;wk border width;$width2[$i];wk border color;"red")

  //$i:=$i+1

  //End for each 



  //PRINT SETTINGS
  ////WP PRINT([SAMPLE]WP)