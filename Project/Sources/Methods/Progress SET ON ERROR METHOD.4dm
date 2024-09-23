//%attributes = {"invisible":true,"shared":true}
#DECLARE($callBackMethod : Text)
var $Error : Text

If (Count parameters:C259>=1)
	<>OnErrorMethod:=$callBackMethod
Else 
	$Error:=Get localized string:C991("IncorrectNumberOfParameters")
End if 

If ($Error#"")
	ALERT:C41($Error)  //can't do better at this stage
End if 
