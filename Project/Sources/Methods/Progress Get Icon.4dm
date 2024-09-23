//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer) : Picture

var $Icon : Picture
var $p : Integer
var $ErrorID : Integer

If (Count parameters:C259>=1)
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		$Icon:=<>_ProgressIcon{$p}
	Else 
		$ErrorID:=1
	End if 
	
	Progress__Semaphore_OFF  //*************
Else 
	$ErrorID:=2
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)

return $Icon




