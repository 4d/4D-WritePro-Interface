<!-- This method updates the widget when modifications have been made. -->
```4d
WP UpdateWidget( widget name {; area name {;skin}})
```
| Parameter   | Type   | in/out | Description |
| ---------   | ------ | ------ | ----------- |
| widget name | String | in     | Form object name    |
| area name   | String | in     | area object name    |
| {skin}      | Object | in     | skin object       |

## Description
This method updates the widget when modifications have been made:
- by programming (only one parameter needed) (main events: on load, on getting focus, on losing focus, on selection change, on after edit)
- using the area (two parameters needed)
- a skin can be sent when using palettes (right widget)

### Skin Object
List of possible attributes for the skin object:

| Attribute          | Type    | Description |
| ----------------   | ------- | ----------- |
| backgroundColor    | Integer | RGB color   |
| separatorColor     | Integer | RGB color   |
| separatorFontColor | Integer | RGB color   |
| fontColor          | Integer | RGB color   |
| font               | String  | font name   |
| fontSize           | Number  | font size   |

## Examples

- Refresh the widget after modifying a property by code
```4d
WP UpdateWidget ("WPtoolbar";"WParea")
```

- Define a skin for both light and dark themes:
```4d
var $wpSkin : Object
$wpSkin:=New object
If(Form Get color scheme="light")
   $wpSkin.backgroundColor:=0x00E2FFFF
   $wpSkin.separatorColor:=0x00B3CACA
   $wpSkin.fontColor:=0x8686
   $wpSkin.separatorFontColor:=0x4E4E
   $wpSkin.font:="Optima"
   $wpSkin.fontSize:=12
Else
   $wpSkin.backgroundColor:=0x0040
   $wpSkin.separatorColor:=0x2080
   $wpSkin.fontColor:=0xC0FF
   $wpSkin.separatorFontColor:=0x00D0D0FF
   $wpSkin.font:="Optima"
   $wpSkin.fontSize:=12
End if
WP UpdateWidget ("WPwidget";"WParea"; $wpSkin)
```
