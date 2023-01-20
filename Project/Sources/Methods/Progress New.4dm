//%attributes = {"invisible":true,"shared":true}
C_BOOLEAN:C305($1)  //set to front (or not if not passed)

C_LONGINT:C283($0)
C_LONGINT:C283($N; $NextID)

C_TEXT:C284($Path)

Progress__Compiler

C_PICTURE:C286($Image)
C_TEXT:C284($Path; $Sep)

Progress__Semaphore_ON  //*************

Progress__Launch  // only once

$Sep:=Folder separator:K24:12
$Path:=Get 4D folder:C485(Current resources folder:K5:16)

//ACI0098693
If (Is Windows:C1573)
	$Path:=$Path+"Images"+$Sep+"File_Win.png"
Else 
	$Path:=$Path+"Images"+$Sep+"File_Mac.png"
End if 
If (Test path name:C476($Path)=Is a document:K24:1)
	READ PICTURE FILE:C678($Path; $Image)
End if 

$n:=Size of array:C274(<>_ProgressID)
SORT ARRAY:C229(<>_ProgressID; >)
$NextID:=<>_ProgressID{$n}+1

APPEND TO ARRAY:C911(<>_ProgressID; $NextID)
APPEND TO ARRAY:C911(<>_ProgressTitle; "")
APPEND TO ARRAY:C911(<>_ProgressMessage; "")
APPEND TO ARRAY:C911(<>_ProgressValue; -1)
APPEND TO ARRAY:C911(<>_ProgressIcon; $Image)
APPEND TO ARRAY:C911(<>_ProgressOnStop; "")
APPEND TO ARRAY:C911(<>_ProgressUpdated; True:C214)
APPEND TO ARRAY:C911(<>_ProgressCancelAllow; False:C215)
APPEND TO ARRAY:C911(<>_ProgressCanceled; False:C215)
APPEND TO ARRAY:C911(<>_ProgressCancelButtonText; Get localized string:C991("BtnStop"))

$n:=$n+1
If ($n>1)
	//add a separation bar to previous one
	<>_ProgressUpdated{$n-1}:=True:C214
End if 

<>UpdateFonts:=True:C214
<>UpdateSizes:=True:C214

Progress__Semaphore_OFF  //*************

POST OUTSIDE CALL:C329(<>PS_Progress)
If (Count parameters:C259>=1)
	BRING TO FRONT:C326(<>PS_Progress)
End if 

$0:=$NextID


