//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer; $CancelAllow : Boolean; $FrontMost : Boolean)

var $ErrorID : Integer

var $p : Integer

var $Title : Text
var $Progress : Real
var $Icon : Picture

If (Count parameters:C259>=2)
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		<>_ProgressCancelAllow{$p}:=$CancelAllow
		<>_ProgressUpdated{$p}:=True:C214
	Else 
		$ErrorID:=1  //bad ID
	End if 
	
	Progress__Semaphore_OFF  //*************
	
	If ($ErrorID=0)
		POST OUTSIDE CALL:C329(<>PS_Progress)
		If ($FrontMost)
			BRING TO FRONT:C326(<>PS_Progress)
		End if 
	End if 
	
Else 
	$ErrorID:=2  // wrong number or parameters
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)


