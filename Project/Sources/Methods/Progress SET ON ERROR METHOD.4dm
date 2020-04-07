//%attributes = {"invisible":true,"shared":true}
C_TEXT:C284($1)  //callback method name
C_TEXT:C284($Error)

If (Count parameters:C259>=1)
	<>OnErrorMethod:=$1
Else 
	$Error:=Get localized string:C991("IncorrectNumberOfParameters")
End if 

If ($Error#"")
	ALERT:C41($Error)  //can't do better at this stage
End if 
