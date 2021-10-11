<!-- This method displays the picture settings dialog box for the first image in the range object. -->

```4d
WP PictureSettings( targetObj )
```

| Parameter | Type   | in/out | Description |
| --------- | ------ | ------ | ----------- |
| targetObj | Object | in     | Range object or Picture object for anchored image |


## Description

This method displays the picture settings dialog box for the first inline image in the range object, or for the anchored image in the picture object.


## Example

```4d
$range:=WP Selection range(*; "WParea")
WP PictureSettings($range)
```
