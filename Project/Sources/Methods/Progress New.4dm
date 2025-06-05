//%attributes = {"invisible":true,"shared":true}
#DECLARE() : Integer

Progress__Compiler

Progress__Semaphore_ON  //*************

Progress__Launch  // only once

var $path:=Get 4D folder:C485(Current resources folder:K5:16)

//ACI0098693
If (Is Windows:C1573)
	$path+="Images"+Folder separator:K24:12+"File_Win.png"
Else 
	$path+="Images"+Folder separator:K24:12+"File_Mac.png"
End if 

var $image : Picture
If (Test path name:C476($path)=Is a document:K24:1)
	READ PICTURE FILE:C678($path; $image)
End if 

var $n:=Size of array:C274(<>_ProgressID)
SORT ARRAY:C229(<>_ProgressID; >)
var $NextID : Integer:=<>_ProgressID{$n}+1

APPEND TO ARRAY:C911(<>_ProgressID; $NextID)
APPEND TO ARRAY:C911(<>_ProgressTitle; "")
APPEND TO ARRAY:C911(<>_ProgressMessage; "")
APPEND TO ARRAY:C911(<>_ProgressValue; -1)
APPEND TO ARRAY:C911(<>_ProgressIcon; $image)
APPEND TO ARRAY:C911(<>_ProgressOnStop; "")
APPEND TO ARRAY:C911(<>_ProgressUpdated; True:C214)
APPEND TO ARRAY:C911(<>_ProgressCancelAllow; False:C215)
APPEND TO ARRAY:C911(<>_ProgressCanceled; False:C215)
APPEND TO ARRAY:C911(<>_ProgressCancelButtonText; Localized string:C991("BtnStop"))

$n+=1
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

return $NextID


