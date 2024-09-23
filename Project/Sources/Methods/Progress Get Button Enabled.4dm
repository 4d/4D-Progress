//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer) : Boolean

var $p : Integer
var $ErrorID : Integer
var $CancelAllow : Boolean

If (Count parameters:C259>=1)
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		$CancelAllow:=<>_ProgressCancelAllow{$p}
	Else 
		$ErrorID:=1  //bad ID
	End if 
	
	Progress__Semaphore_OFF  //*************
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)

return $CancelAllow




