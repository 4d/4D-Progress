//%attributes = {"invisible":true,"shared":true}
C_LONGINT:C283($1)  //Reference of Progress
C_TEXT:C284($0)

C_TEXT:C284($Title)
C_LONGINT:C283($p)

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($ProgressID)  // progress code

If (Count parameters:C259>=1)
	
	$ProgressID:=$1
	
	Progress__Semaphore_ON   //*************
	
	$p:=Find in array:C230(<>_ProgressID;$ProgressID)
	If ($p>0)
		$Title:=<>_ProgressTitle{$p}
	Else 
		$ErrorID:=1  //bad ID
	End if 
	
	Progress__Semaphore_OFF   //*************
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError ($ErrorID;$ProgressID)

$0:=$Title




