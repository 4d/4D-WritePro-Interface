<!-- This method allows switching between toolbar interfaces. -->
```4d
WP SwitchToolbar( widget name ; toolbar name )
```
| Parameter | Type   | in/out | Description |
| --------- | ------ | ------ | ----------- |
| widget name    | String | in     | Form object name    |
| toolbar name   | String | in     | Name of toolbar: Toolbar1 or Toolbar2 |

## Description
This method allows switching between toolbar interfaces.

## Example
```4d
WP SwitchToolbar ("WParea" ; "Toolbar1")
WP SwitchToolbar ("WParea" ; "Toolbar2")
```
