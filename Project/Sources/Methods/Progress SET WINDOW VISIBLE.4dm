//%attributes = {"invisible":true,"shared":true}
#DECLARE($Show : Boolean/*Hide (false) or Show (true)*/; $WinPosX : Integer; $WinPosY : Integer; $FrontMost : Boolean)

//Optional XY position of window (-1;-1;true) will NOT move the window

var $x1; $y1; $x2; $y2 : Integer
var $ChangePosition : Boolean
var $Error : Text

var $ErrorID : Integer
var $ProgressID : Integer  // progress code ????

$Show:=True:C214
$WinPosX:=-1
$WinPosY:=-1
$ChangePosition:=False:C215
$FrontMost:=False:C215

If (Count parameters:C259=2)
	//only  X without Y !
	$ErrorID:=2  // wrong number or parameters
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
		GET WINDOW RECT:C443($x1; $y1; $x2; $y2; <>ProgressWindow)
		SET WINDOW RECT:C444($WinPosX; $WinPosY; $WinPosX+($x2-$x1); $WinPosY+($y2-$y1); <>ProgressWindow; *)  // * means don't bring to front automatically !
	End if 
	
Else 
	Progress__ManageMethodsError($ErrorID; $ProgressID)
End if 
