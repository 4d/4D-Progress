//%attributes = {"invisible":true}
C_TEXT:C284($1)
C_LONGINT:C283($2)

C_TEXT:C284($CallbackMethod)
C_LONGINT:C283($ProgressID)

C_TEXT:C284($Alert)

$CallbackMethod:=$1
$ProgressID:=$2

<>ProgressError:=0
ON ERR CALL:C155("Progress__TrapError")
EXECUTE METHOD:C1007($CallbackMethod;*;$ProgressID)
ON ERR CALL:C155("")

If (<>ProgressError=-10508)
	$Alert:=Get localized string:C991("MethodDoesNotExist")
	$Alert:=Replace string:C233($Alert;"{MethodName}";$CallbackMethod)
	
	ALERT:C41($Alert)
End if 
