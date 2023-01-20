//%attributes = {"invisible":true,"shared":true}
C_LONGINT:C283($1)  //Reference of Progress to stop
C_BOOLEAN:C305($0)

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($ProgressID)  // progress code

C_LONGINT:C283($i; $p; $n)
C_TEXT:C284($Error)
C_BOOLEAN:C305($Canceled)

$Error:=""

If (Count parameters:C259>=1)
	
	$ProgressID:=$1
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		$Canceled:=<>_ProgressCanceled{$p}
	Else 
		$Canceled:=True:C214
	End if 
	
	Progress__Semaphore_OFF  //*************
	
Else 
	$ErrorID:=2  // wrong number or parameters
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)

$0:=$Canceled