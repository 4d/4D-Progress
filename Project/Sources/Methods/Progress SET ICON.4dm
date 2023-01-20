//%attributes = {"invisible":true,"shared":true}
C_LONGINT:C283($1)  // Reference of Progress
C_PICTURE:C286($2)  // icon
C_BOOLEAN:C305($3)  // forces foreground window if passed

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($ProgressID)  // progress code

C_LONGINT:C283($p; $CountParam)
C_TEXT:C284($Error)

C_TEXT:C284($Title)
C_REAL:C285($Progress)
C_TEXT:C284($Message)
C_PICTURE:C286($Icon)
C_BOOLEAN:C305($FrontMost)

$CountParam:=Count parameters:C259
If ($CountParam>=2)
	
	$ProgressID:=$1
	$Icon:=$2
	If (Count parameters:C259>=3)
		$FrontMost:=$3
	End if 
	
	Progress__Semaphore_ON  //*************
	
	$p:=Find in array:C230(<>_ProgressID; $ProgressID)
	If ($p>0)
		<>_ProgressIcon{$p}:=$Icon
		<>_ProgressUpdated{$p}:=True:C214
	Else 
		$ErrorID:=1  //bad ID
	End if 
	
	Progress__Semaphore_OFF  //*************
	
	If ($ErrorID=0)
		POST OUTSIDE CALL:C329(<>PS_Progress)
		If ($FrontMost)
			BRING TO FRONT:C326(<>PS_Progress)
		End if 
	End if 
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError($ErrorID; $ProgressID)



