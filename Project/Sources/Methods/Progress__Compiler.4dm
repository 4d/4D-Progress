//%attributes = {"invisible":true}
Compiler_Variables 
Compiler_Variables_Inter 

If (Not:C34(<>ProgressInited))
	
	<>ProgressInited:=True:C214
	ARRAY LONGINT:C221(<>_ProgressID;0)
	ARRAY TEXT:C222(<>_ProgressTitle;0)
	ARRAY TEXT:C222(<>_ProgressMessage;0)
	ARRAY REAL:C219(<>_ProgressValue;0)
	ARRAY PICTURE:C279(<>_ProgressIcon;0)
	ARRAY TEXT:C222(<>_ProgressOnStop;0)
	ARRAY BOOLEAN:C223(<>_ProgressUpdated;0)
	ARRAY BOOLEAN:C223(<>_ProgressCancelAllow;0)  //set to false by PROGRESS New, set to true by command PROGRESS SET CANCEL ALLOWED
	ARRAY BOOLEAN:C223(<>_ProgressCanceled;0)  //set to false by PROGRESS New, set to false by progress button in progress (when ALLOWED)
	ARRAY TEXT:C222(<>_ProgressCancelButtonText;0)
	
	<>FontMessage1:=""
	<>FontMessage2:=""
	<>FontStopButton:=""
	<>SizeMessage1:=0
	<>SizeMessage2:=0
	<>SizeStopButton:=0
	
End if 

C_LONGINT:C283(<>ErrorRange)
<>ErrorRange:=6510
