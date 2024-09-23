//%attributes = {"invisible":true,"shared":true}
#DECLARE($ProgressID : Integer; $Title : Text; $Progress : Real; $Message : Text; $FrontMost : Boolean)

var $ErrorID; $p : Integer
var $CountParam : Integer

$CountParam:=Count parameters:C259
If ($CountParam>=2)
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		<>_ProgressTitle{$p}:=$Title
		If ($CountParam>=3)
			<>_ProgressValue{$p}:=$Progress
			If ($CountParam>=4)
				<>_ProgressMessage{$p}:=$Message
			End if 
		End if 
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

