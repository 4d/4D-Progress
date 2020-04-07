//%attributes = {"invisible":true,"shared":true}
C_LONGINT:C283($1)  //Reference of Progress
C_BOOLEAN:C305($0)

C_TEXT:C284($Message)

C_LONGINT:C283($p)

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($ProgressID)  // progress code

C_BOOLEAN:C305($CancelAllow)

C_TEXT:C284($Error)

If (Count parameters:C259>=1)
	
	$ProgressID:=$1
	
	Progress__Semaphore_ON   //*************
	
	$p:=Find in array:C230(<>_ProgressID;$ProgressID)
	If ($p>0)
		$CancelAllow:=<>_ProgressCancelAllow{$p}
	Else 
		$ErrorID:=1  //bad ID
	End if 
	
	Progress__Semaphore_OFF   //*************
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError ($ErrorID;$ProgressID)

$0:=$CancelAllow




