//%attributes = {}
#DECLARE($filter : Object)->$tableList : Object

//$filter.fields : collection of field names
//$filter.tables : collection of table names


var $file : 4D:C1709.File
var $structure; $table; $field : Object
var $tempCol; $tablesDictionnary; $fieldsDictionnary; $col; $result : Collection
var $dataclassName; $attributeName : Text
var $value : Text
var $i; $p : Integer

// FILL structure definition (Tables. and .attributes)

$structure:=New object:C1471()  //∆∆∆
$structure.tables:=New collection:C1472
For each ($dataclassName; ds:C1482)
	$structure.tables.push(New object:C1471("original"; $dataclassName; "translation"; $dataclassName))
End for each 

$structure.fields:=New collection:C1472
For each ($dataclassName; ds:C1482)
	For each ($attributeName; ds:C1482[$dataclassName])
		$tempCol:=$structure.fields.query("original = :1"; $attributeName)
		If ($tempCol.length=0)
			$structure.fields.push(New object:C1471("original"; $attributeName; "translation"; $attributeName))
		End if 
	End for each 
End for each 



Case of 
		
	: (False:C215)  // FILL dictionnary entries - ONLY translated fields will be kept
		
		$tablesDictionnary:=New collection:C1472()  //∆∆∆
		
		$tablesDictionnary.push(New object:C1471("original"; "Company"; "translation"; "Compagnie"))
		$tablesDictionnary.push(New object:C1471("original"; "People"; "translation"; "Personnes"))
		$tablesDictionnary.push(New object:C1471("original"; "Documents"; "translation"; "Documents"))
		$tablesDictionnary.push(New object:C1471("original"; "Preferences"; "translation"; "Préférences"))
		$tablesDictionnary.push(New object:C1471("original"; "Invoice"; "translation"; "Facture"))
		
		$fieldsDictionnary:=New collection:C1472()
		
		$fieldsDictionnary.push(New object:C1471("original"; "lastname"; "translation"; "nom"))
		$fieldsDictionnary.push(New object:C1471("original"; "name"; "translation"; "nom"))
		$fieldsDictionnary.push(New object:C1471("original"; "firstname"; "translation"; "prénom"))
		$fieldsDictionnary.push(New object:C1471("original"; "fullName"; "translation"; "nom complet"))
		$fieldsDictionnary.push(New object:C1471("original"; "phone"; "translation"; "téléphone"))
		$fieldsDictionnary.push(New object:C1471("original"; "city"; "translation"; "ville"))
		$fieldsDictionnary.push(New object:C1471("original"; "address"; "translation"; "adresse"))
		$fieldsDictionnary.push(New object:C1471("original"; "fullAddress"; "translation"; "adresse complète"))
		$fieldsDictionnary.push(New object:C1471("original"; "zipCode"; "translation"; "codePostal"))
		$fieldsDictionnary.push(New object:C1471("original"; "title"; "translation"; "titre"))
		$fieldsDictionnary.push(New object:C1471("original"; "country"; "translation"; "pays"))
		$fieldsDictionnary.push(New object:C1471("original"; "eMail"; "translation"; "courriel"))
		$fieldsDictionnary.push(New object:C1471("original"; "continent"; "translation"; "continent"))
		$fieldsDictionnary.push(New object:C1471("original"; "hireDate"; "translation"; "date embauche"))
		$fieldsDictionnary.push(New object:C1471("original"; "worksFrom"; "translation"; "début travail"))
		$fieldsDictionnary.push(New object:C1471("original"; "worksTo"; "translation"; "fin travail"))
		$fieldsDictionnary.push(New object:C1471("original"; "salary"; "translation"; "salaire"))
		$fieldsDictionnary.push(New object:C1471("original"; "portrait"; "translation"; "portrait"))
		//$fieldsDictionnary.push(New object("original"; "passWord"; "translation"; "mot de passe"))
		$fieldsDictionnary.push(New object:C1471("original"; "gender"; "translation"; "genre"))
		$fieldsDictionnary.push(New object:C1471("original"; "people"; "translation"; "personne"))
		$fieldsDictionnary.push(New object:C1471("original"; "description"; "translation"; "description"))
		$fieldsDictionnary.push(New object:C1471("original"; "language"; "translation"; "langue"))
		$fieldsDictionnary.push(New object:C1471("original"; "car"; "translation"; "voiture"))
		$fieldsDictionnary.push(New object:C1471("original"; "company"; "translation"; "compagnie"))
		$fieldsDictionnary.push(New object:C1471("original"; "group"; "translation"; "groupe"))
		$fieldsDictionnary.push(New object:C1471("original"; "preferences"; "translation"; "préférences"))
		
		$fieldsDictionnary.push(New object:C1471("original"; "driver1"; "translation"; "conducteur 1"))
		$fieldsDictionnary.push(New object:C1471("original"; "driver2"; "translation"; "conducteur 2"))
		$fieldsDictionnary.push(New object:C1471("original"; "departureAgency"; "translation"; "agence départ"))
		$fieldsDictionnary.push(New object:C1471("original"; "arrivalAgency"; "translation"; "agence arrivée"))
		
		
		$i:=$structure.tables.length-1
		For each ($table; $structure.tables.reverse())
			$col:=$tablesDictionnary.query("original = :1"; $table.original)
			
			If ($col.length>0)
				$table.translation:=$col[0].translation
			Else 
				$structure.tables:=$structure.tables.remove($i)
			End if 
			$i:=$i-1
		End for each 
		
		
		$i:=$structure.fields.length-1
		For each ($field; $structure.fields.reverse())
			$col:=$fieldsDictionnary.query("original = :1"; $field.original)
			
			If ($col.length>0)
				$field.translation:=$col[0].translation
			Else 
				$structure.fields:=$structure.fields.remove($i)
			End if 
			$i:=$i-1
		End for each 
		
		
	: (True:C214)
		
		//ex : $filter.tables:=New collection("HiddenTable")
		
		If (Count parameters:C259>=1) && (Not:C34(Undefined:C82($filter.tables)))
			For each ($value; $filter.tables)
				$result:=$structure.tables.query("original = :1"; $value)
				If ($result.length>0)
					$p:=$structure.tables.indexOf($result[0])
					$structure.tables:=$structure.tables.remove($p)
				End if 
			End for each 
		End if 
		
		//fields to be removed from list
		//ex : $filter.fields:=New collection("ID"; "CompanyID"; "password"; "groupID"; "documentID"; "preferencesID"; "parametersID"; "hiddenID"; "driver1ID"; "driver2ID"; "departureAgencyID"; "arrivalAgencyID")
		
		If (Count parameters:C259>=1) && (Not:C34(Undefined:C82($filter.fields)))
			For each ($value; $filter.fields)
				$result:=$structure.fields.query("original = :1"; $value)
				If ($result.length>0)
					$p:=$structure.fields.indexOf($result[0])
					$structure.fields:=$structure.fields.remove($p)
				End if 
			End for each 
		End if 
		
		
End case 

$file:=File:C1566(Folder:C1567(fk resources folder:K87:11; *).platformPath+"structureTranslation.json"; fk platform path:K87:2)
If ($file.exists)
	$file.delete()
End if 

$file.create()
$file.setText(JSON Stringify:C1217($structure; *))

//$filePath:=Folder(fk resources folder; *).platformPath+"structureTranslation.json"
//TEXT TO DOCUMENT($filePath; JSON Stringify($structure; *))
//ALERT("The structureTranslation.json file has been created in the resources folder.")

