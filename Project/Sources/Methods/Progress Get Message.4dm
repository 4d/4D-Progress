//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer) : Text


var $Message : Text
var $p : Integer
var $Error : Text

var $ErrorID : Integer

If (Count parameters:C259>=1)
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		$Message:=<>_ProgressMessage{$p}
	Else 
		$ErrorID:=1
	End if 
	
	Progress__Semaphore_OFF  //*************
	
Else 
	$ErrorID:=2
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)

return $Message




