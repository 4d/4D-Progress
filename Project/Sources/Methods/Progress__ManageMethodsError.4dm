//%attributes = {"invisible":true}
#DECLARE($ErrorID : Integer; $ProgressID : Integer)

var $ErrorText : Text  // error text


If ($ErrorID#0)
	
	Case of 
		: ($ErrorID=1)  // bad ID
			$ErrorText:=Replace string:C233(Get localized string:C991("UnknownProgressID"); "{id}"; String:C10($ProgressID))
			
		: ($ErrorID=2)  // wrong number of parameters
			$ErrorText:=Get localized string:C991("IncorrectNumberOfParameters")
			
	End case 
	
	$ErrorID:=$ErrorID+<>ErrorRange-1  // 6510, 6511, 6512 jusqu'à 6519 MAXI
	
	If ($ErrorID>=6510) & ($ErrorID<=6519)
		
		If (<>OnErrorMethod#"")
			
			<>ProgressError:=0
			ON ERR CALL:C155("Progress__TrapError")
			EXECUTE METHOD:C1007(<>OnErrorMethod; *; $ErrorID; $ErrorText; $ProgressID)
			ON ERR CALL:C155("")
			If (<>ProgressError=-10508)
				$ErrorText:=Replace string:C233(Get localized string:C991("MethodDoesNotExist"); "{MethodName}"; <>OnErrorMethod)
				ALERT:C41($ErrorText)  //∆∆∆
			End if 
		Else 
			ALERT:C41($ErrorText)
		End if 
		
	Else 
		BEEP:C151
	End if 
	
End if 


