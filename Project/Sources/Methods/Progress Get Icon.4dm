//%attributes = {"invisible":true,"shared":true}
C_LONGINT:C283($1)  //Reference of Progress
C_PICTURE:C286($0)

C_PICTURE:C286($Icon)
C_LONGINT:C283($p)

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($ProgressID)  // progress code

If (Count parameters:C259>=1)
	
	$ProgressID:=$1
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		$Icon:=<>_ProgressIcon{$p}
	Else 
		$ErrorID:=1
	End if 
	
	Progress__Semaphore_OFF  //*************
Else 
	$ErrorID:=2
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)

$0:=$Icon




