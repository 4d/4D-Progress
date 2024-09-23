//%attributes = {"invisible":true,"shared":true}
#DECLARE($fontMessage1 : Text; $fontMessage2 : Text; $fontStopButton : Text)

var $ErrorID : Integer
var $CountParam : Integer

$CountParam:=Count parameters:C259
If ($CountParam>=1)
	If ($fontMessage1#"")
		<>FontMessage1:=$fontMessage1
	End if 
	If ($CountParam>=2)
		If ($fontMessage2#"")
			<>FontMessage2:=$fontMessage2
		End if 
		If ($CountParam>=3)
			If ($fontStopButton#"")
				<>FontStopButton:=$fontStopButton
			End if 
		End if 
	End if 
	
	<>UpdateFonts:=True:C214
	POST OUTSIDE CALL:C329(<>PS_Progress)
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError($ErrorID; 0)

