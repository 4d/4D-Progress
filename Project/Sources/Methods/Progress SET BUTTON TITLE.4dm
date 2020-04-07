//%attributes = {"invisible":true,"shared":true}
C_LONGINT:C283($1)  //Reference of Progress
C_TEXT:C284($2)  // mandatory (title)
C_BOOLEAN:C305($3)  //If passed then the progress window becomes the foreground window

C_LONGINT:C283($ProgressID)  // progress code
C_TEXT:C284($CancelButtonText)
C_BOOLEAN:C305($FrontMost)

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($p;$CountParam)

$CountParam:=Count parameters:C259
If ($CountParam>=2)
	
	$ProgressID:=$1
	$CancelButtonText:=$2
	If ($CountParam>=3)
		$FrontMost:=$3
	End if 
	
	Progress__Semaphore_ON   //*************
	
	$p:=Find in array:C230(<>_ProgressID;$ProgressID)
	If ($p>0)
		<>_ProgressCancelButtonText{$p}:=$CancelButtonText
		<>_ProgressUpdated{$p}:=True:C214
	Else 
		$ErrorID:=1  //bad ID
	End if 
	
	Progress__Semaphore_OFF   //*************
	
	If ($ErrorID=0)
		POST OUTSIDE CALL:C329(<>PS_Progress)
		If ($FrontMost)
			BRING TO FRONT:C326(<>PS_Progress)
		End if 
	End if 
	
Else 
	$ErrorID:=2  // wrong number or parameters
End if 

Progress__ManageMethodsError ($ErrorID;0)

