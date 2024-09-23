//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer) : Text

var $Title : Text
var $p : Integer
var $ErrorID : Integer

If (Count parameters:C259>=1)
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		$Title:=<>_ProgressCancelButtonText{$p}
	Else 
		$ErrorID:=1  //wrong ID
	End if 
	
	Progress__Semaphore_OFF  //*************
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)

return $Title




