//%attributes = {"invisible":true,"shared":true}
C_LONGINT:C283($1)  //Reference of Progress
C_TEXT:C284($0)

C_TEXT:C284($Message)
C_LONGINT:C283($p)
C_TEXT:C284($Error)

C_LONGINT:C283($ErrorID)  //Error code
C_TEXT:C284($ErrorText)  // error text
C_LONGINT:C283($ProgressID)

If (Count parameters:C259>=1)
	
	$ProgressID:=$1
	
	Progress__Semaphore_ON   //*************
	
	$p:=Find in array:C230(<>_ProgressID;$ProgressID)
	If ($p>0)
		$Message:=<>_ProgressMessage{$p}
	Else 
		$ErrorID:=1
	End if 
	
	Progress__Semaphore_OFF   //*************
	
Else 
	$ErrorID:=2
End if 

Progress__ManageMethodsError ($ErrorID;$ProgressID)

$0:=$Message




