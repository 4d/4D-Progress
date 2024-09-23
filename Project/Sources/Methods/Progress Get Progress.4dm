//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer) : Real

var $p : Integer
var $ErrorID : Integer
var $Value : Real

If (Count parameters:C259>=1)
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		$Value:=<>_ProgressValue{$p}
	Else 
		$ErrorID:=1  //bad ID
	End if 
	
	Progress__Semaphore_OFF  //*************
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)

return $Value




