//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer) : Boolean

var $ErrorID : Integer  //Error code

var $p : Integer
var $Error : Text
var $Canceled : Boolean

$Error:=""

If (Count parameters:C259>=1)
	
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		$Canceled:=<>_ProgressCanceled{$p}
	Else 
		$Canceled:=True:C214
	End if 
	
	Progress__Semaphore_OFF  //*************
	
Else 
	$ErrorID:=2  // wrong number or parameters
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)

return $Canceled