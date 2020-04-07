//%attributes = {"invisible":true,"shared":true}
C_LONGINT:C283($1)  //Reference of Progress
C_TEXT:C284($2)  //Almost mandatory (title)
C_REAL:C285($3)  //optionnel (progress value)
C_TEXT:C284($4)  //optionnel (message)
C_BOOLEAN:C305($5)  //If passed then the progress window becomes the frontmost window

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($ProgressID)  // progress code

C_LONGINT:C283($p;$CountParam)

C_TEXT:C284($Title)
C_REAL:C285($Progress)
C_TEXT:C284($Message)
C_PICTURE:C286($Icon)
C_BOOLEAN:C305($FrontMost)

$CountParam:=Count parameters:C259
If ($CountParam>=2)
	
	$ProgressID:=$1
	$Title:=$2
	
	If ($CountParam>=3)
		$Progress:=$3
		If ($CountParam>=4)
			$Message:=$4
			If ($CountParam>=5)
				$FrontMost:=$5
			End if 
		End if 
	End if 
	
	Progress__Semaphore_ON   //*************
	
	$p:=Find in array:C230(<>_ProgressID;$ProgressID)
	If ($p>0)
		<>_ProgressTitle{$p}:=$Title
		If ($CountParam>=3)
			<>_ProgressValue{$p}:=$Progress
			If ($CountParam>=4)
				<>_ProgressMessage{$p}:=$Message
			End if 
		End if 
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

Progress__ManageMethodsError ($ErrorID;$ProgressID)

