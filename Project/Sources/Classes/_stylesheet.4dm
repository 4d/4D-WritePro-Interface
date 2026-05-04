property name : Text

// FIXME: Use 4D.Write class
property owner : Object/*4D.WriteDocument*/
property type : Integer
property font; fontSize : Text
property marginBottom; marginLeft; marginRright; marginTop : Text

// MARK: List
property listConcatStringFormat : Boolean
property listLevelCount; listLevelIndex; listStyleType : Integer
property listFont; listRootStyle : Text
property listImageURLtext

Class constructor
	
Function getAttibutes() : Collection