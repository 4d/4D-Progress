//%attributes = {"invisible":true,"shared":true}

C_LONGINT:C283($1)  // mandatory (Title size)
C_LONGINT:C283($2)
C_LONGINT:C283($3)

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($CountParam)

$CountParam:=Count parameters:C259
If ($CountParam>=1)
	If ($1>0)
		<>SizeMessage1:=$1
	End if 
	If ($CountParam>=2)
		If ($2>0)
			<>SizeMessage2:=$2
		End if 
		If ($CountParam>=3)
			If ($3>0)
				<>SizeStopButton:=$3
			End if 
		End if 
	End if 
	
	<>UpdateSizes:=True:C214
	POST OUTSIDE CALL:C329(<>PS_Progress)
	
Else 
	$ErrorID:=2  // wrong number or parameters
End if 

Progress__ManageMethodsError ($ErrorID;0)

