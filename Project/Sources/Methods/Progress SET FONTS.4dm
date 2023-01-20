//%attributes = {"invisible":true,"shared":true}

C_TEXT:C284($1)  // mandatory (Title font)
C_TEXT:C284($2)
C_TEXT:C284($3)

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($CountParam)

$CountParam:=Count parameters:C259
If ($CountParam>=1)
	If ($1#"")
		<>FontMessage1:=$1
	End if 
	If ($CountParam>=2)
		If ($2#"")
			<>FontMessage2:=$2
		End if 
		If ($CountParam>=3)
			If ($3#"")
				<>FontStopButton:=$3
			End if 
		End if 
	End if 
	
	<>UpdateFonts:=True:C214
	POST OUTSIDE CALL:C329(<>PS_Progress)
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError($ErrorID; 0)

