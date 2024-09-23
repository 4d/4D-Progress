//%attributes = {"invisible":true}
#DECLARE($CallbackMethod : Text; $ProgressID : Integer)

var $Alert : Text

<>ProgressError:=0
ON ERR CALL:C155("Progress__TrapError")
EXECUTE METHOD:C1007($CallbackMethod; *; $ProgressID)
ON ERR CALL:C155("")

If (<>ProgressError=-10508)
	$Alert:=Get localized string:C991("MethodDoesNotExist")
	$Alert:=Replace string:C233($Alert; "{MethodName}"; $CallbackMethod)
	
	ALERT:C41($Alert)
End if 
