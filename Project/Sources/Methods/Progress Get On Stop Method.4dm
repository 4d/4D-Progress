//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer) : Text

var $OnStopMethod : Text
var $ErrorID : Integer
var $p : Integer

If (Count parameters:C259>=1)
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		$OnStopMethod:=<>_ProgressOnStop{$p}
	Else 
		$ErrorID:=1  //wrong ID
	End if 
	
	Progress__Semaphore_OFF  //*************
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)

return $OnStopMethod




