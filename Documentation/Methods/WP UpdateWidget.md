<!-- This method updates the widget when modifications have been made. -->
```4d
WP UpdateWidget( widget name {; area name {;skin}})
```
| Parameter   | Type   | in/out | Description |
| ---------   | ------ | ------ | ----------- |
| widget name | String | in     | Form object name    |
| area name   | String | in     | area object name    |
| {skin}      | Object | in     | skin variable       |

## Description
This method updates the widget when modifications have been made
- by programming (only one parameter needed)
- using the area (two parameters needed)
-- a skin can be sent when using palettes (right widget)
## Example
```4d
WP UpdateWidget ("WPtoolbar";"WParea")
```
