//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer; $OnStopMethodName : Text; $FrontMost : Boolean)

var $ErrorID : Integer
var $p : Integer

If (Count parameters:C259>=2)
	<>_ProgressOnStop{$p}:=$OnStopMethodName
	<>_ProgressUpdated{$p}:=True:C214
Else 
	$ErrorID:=1  //bad ID
End if 

POST OUTSIDE CALL:C329(<>PS_Progress)
If ($FrontMost)
	BRING TO FRONT:C326(<>PS_Progress)
End if 
End if 
Else 
$ErrorIEnd if

Progress__ManageMethodsError($ErrorID; $ProgressID)



