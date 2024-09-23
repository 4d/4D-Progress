//%attributes = {"invisible":true,"shared":true}
#DECLARE($sizeMessage1 : Integer; $sizeMessage2 : Integer; $sizeStopButton : Integer)

var $ErrorID : Integer
var $CountParam : Integer

$CountParam:=Count parameters:C259
If ($CountParam>=1)
	If ($sizeMessage1>0)
		<>SizeMessage1:=$sizeMessage1
	End if 
	If ($CountParam>=2)
		If ($sizeMessage2>0)
			<>SizeMessage2:=$sizeMessage2
		End if 
		If ($CountParam>=3)
			If ($sizeStopButton>0)
				<>SizeStopButton:=$sizeStopButton
			End if 
		End if 
	End if 
	
	<>UpdateSizes:=True:C214
	POST OUTSIDE CALL:C329(<>PS_Progress)
	
Else 
	$ErrorID:=2  // wrong number or parameters
End if 

Progress__ManageMethodsError($ErrorID; 0)

