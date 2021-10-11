<!-- WP ShowTabPages( widget name ; toolbar name )
This method allows you to define the tabs to be displayed, as well as the order of the tabs. -->
```4d
WP ShowTabPages( widget name ; toolbar name )
```

|Parameter|Type|In/Out|Description|
|---|---|---|---|
|widget name|String|In|Form object name|
|tab names|Collection|In|List of the tab names to display|


## Description

This method allows you to define the tabs to be displayed, as well as their order.

For toolbars, the following tabs are available:

* "Home"
* "Insert"
* "Margins"
* "Borders"
* "Images"
* "Printing"
* "Tables"
* "Spell"
* "Protection"
* "ImportExport"
* "FindAndReplace"

For sidebars, the following tabs are available:

* "Fonts"
* "Alignments"
* "Tabulations"
* "Frames"
* "Sizes"
* "Backgrounds"
* "Expressions"
* "Bookmarks"
* "Stylesheets"
* "Tables"
* "Protection"
* "ImportExport"
* "FindAndReplace"

## Example

Example for sidebars:

```code4d
$tabs:=New collection("ImportExport";"Fonts";"Alignments";"Tabulations")
WP ShowTabPages ("WPwidget";$tabs)
```


