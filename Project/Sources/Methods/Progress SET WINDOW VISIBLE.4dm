//%attributes = {"invisible":true,"shared":true}

C_BOOLEAN:C305($1)  // Hide (false) or Show (true)
C_LONGINT:C283($2;$3)  //Optional XY position of window (-1;-1;true) will NOT move the window
C_BOOLEAN:C305($4)  //bring to front

C_LONGINT:C283($WinPosX;$WinPosY)
C_LONGINT:C283($x1;$y1;$x2;$y2)
C_BOOLEAN:C305($FrontMost;$ChangePosition;$Show)
C_TEXT:C284($Error)

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($ProgressID)  // progress code

$Show:=True:C214
$WinPosX:=-1
$WinPosY:=-1
$ChangePosition:=False:C215
$FrontMost:=False:C215

If (Count parameters:C259>=1)
	$Show:=$1
	If (Count parameters:C259>=2)
		If (Count parameters:C259>2)
			$WinPosX:=$2
			$WinPosY:=$3
			If (Count parameters:C259>=4)
				$FrontMost:=$4
			End if 
		Else 
			  //only  X without Y !
			$ErrorID:=2  // wrong number or parameters
		End if 
	End if 
End if 

If ($ErrorID=0)
	If ($Show)
		SHOW PROCESS:C325(<>PS_Progress)
		If ($FrontMost)
			BRING TO FRONT:C326(<>PS_Progress)
		End if 
	Else 
		HIDE PROCESS:C324(<>PS_Progress)
	End if 
	
	If ($WinPosX#-1) & ($WinPosY#-1)
		GET WINDOW RECT:C443($x1;$y1;$x2;$y2;<>ProgressWindow)
		SET WINDOW RECT:C444($WinPosX;$WinPosY;$WinPosX+($x2-$x1);$WinPosY+($y2-$y1);<>ProgressWindow;*)  // * means don't bring to front automatically !
	End if 
	
Else 
	Progress__ManageMethodsError ($ErrorID;$ProgressID)
End if 
