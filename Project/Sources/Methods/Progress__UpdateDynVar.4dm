//%attributes = {"invisible":true}

C_LONGINT:C283($1)
C_LONGINT:C283($ProgressID)

C_LONGINT:C283($x1;$y1;$x2;$y2)
C_LONGINT:C283($MemoX)
C_LONGINT:C283($p;$n)
C_LONGINT:C283($BestWidth;$BestHeight)

C_TEXT:C284($Sep;$Path;$Limit)

C_POINTER:C301($ptr)
C_POINTER:C301($ptrProgress)
C_POINTER:C301($ptrThermo)

C_REAL:C285($CurrentProgress;$NewProgress)

C_POINTER:C301($PtrCancelAllow)
C_POINTER:C301($ptrCallback)

C_LONGINT:C283($CurrentCancelAllow;$NewCancelAllow)
C_TEXT:C284($CurrentCallback;$NewCallback)
C_TEXT:C284($CurrentCancelText;$NewCancelText)

$ProgressID:=$1

$n:=Size of array:C274(<>_ProgressID)  // number of progress bars
$p:=Find in array:C230(<>_ProgressID;$ProgressID)  // position of the concern progress bar
If ($p>0)
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Message1")
	$ptr->:=<>_ProgressTitle{$p}
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Message2")
	$ptr->:=<>_ProgressMessage{$p}
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"Icon")
	$ptr->:=<>_ProgressIcon{$p}
	
	$ptr:=OBJECT Get pointer:C1124(Object named:K67:5;"ProgressID")
	$ptr->:=<>_ProgressID{$p}
	
	$NewProgress:=<>_ProgressValue{$p}
	$NewCancelAllow:=Num:C11(<>_ProgressCancelAllow{$p})
	$NewCallback:=<>_ProgressOnStop{$p}
	$NewCancelText:=<>_ProgressCancelButtonText{$p}
	
	OBJECT SET VISIBLE:C603(*;"SepLine";$p<$n)  // hides the last separator
	
Else 
	
	OBJECT SET VISIBLE:C603(*;"SepLine";False:C215)
	
End if 

  //  progress (updated only if change)

$ptrProgress:=OBJECT Get pointer:C1124(Object named:K67:5;"ProgressValue")
$CurrentProgress:=$ptrProgress->

If ($CurrentProgress#$NewProgress)
	$ptrProgress->:=$NewProgress  // memo new value
	
	$ptrThermo:=OBJECT Get pointer:C1124(Object named:K67:5;"ThermoProgress")
	
	If ($NewProgress<0)
		OBJECT SET FORMAT:C236(*;"ThermoProgress";"0;100;1;1;128")  // undertermined mode format
		$ptrThermo->:=1  //pour que ça bouge quand même !
	Else 
		OBJECT SET FORMAT:C236(*;"ThermoProgress";"0;100;1;1;0")  // progress mode format
		$ptrThermo->:=100*$NewProgress
	End if 
End if 

  //  cancelAllow (updated only if something changes (title, size, font)

$PtrCancelAllow:=OBJECT Get pointer:C1124(Object named:K67:5;"CancelAllow")
$CurrentCancelAllow:=$PtrCancelAllow->


$CurrentCancelText:=OBJECT Get title:C1068(*;"StopButton")

If ($CurrentCancelAllow#$NewCancelAllow) | ($CurrentCancelText#$NewCancelText) | (<>UpdateFonts) | (<>UpdateSizes)
	
	$PtrCancelAllow->:=$NewCancelAllow
	If (Is Windows:C1573)  // RL 2019/12/02
		OBJECT SET TITLE:C194(*;"StopButton";$NewCancelText)
	End if 
	
	If ($NewCancelAllow=0)
		  //masquer bouton
		OBJECT SET VISIBLE:C603(vStopButton;False:C215)
		$Limit:="Line2"
	Else 
		  //montrer bouton
		
		OBJECT SET VISIBLE:C603(vStopButton;True:C214)
		$Limit:="Line1"
		
		
		If (Is Windows:C1573)  //| (Macintosh option down)  // WINDOWS ONLY !!!!!!!!!
			OBJECT GET BEST SIZE:C717(*;"StopButton";$BestWidth;$BestHeight)
			$BestHeight:=$BestHeight+20  // security margin
			If ($BestWidth<60)
				$BestWidth:=60
			End if 
			If ($BestWidth>200)
				$BestWidth:=200
			End if 
			OBJECT GET COORDINATES:C663(*;"StopButton";$x1;$y1;$x2;$y2)
			OBJECT MOVE:C664(*;"StopButton";$x2-$BestWidth;$y1;$x2;$y2;*)
			
			OBJECT GET COORDINATES:C663(*;"Line2";$x1;$y1;$x2;$y2)
			OBJECT MOVE:C664(*;"Line1";$x1-$BestWidth-20;$y1;$x1-$BestWidth-20;$y2;*)  // move of "Line1"
			
		End if 
		
	End if 
	
	
	OBJECT GET COORDINATES:C663(*;$Limit;$x1;$y1;$MemoX;$y2)
	
	OBJECT GET COORDINATES:C663(*;"message1";$x1;$y1;$x2;$y2)  //message1
	OBJECT MOVE:C664(*;"message1";$x1;$y1;$MemoX;$y2;*)
	
	OBJECT GET COORDINATES:C663(*;"message2";$x1;$y1;$x2;$y2)  //message2
	OBJECT MOVE:C664(*;"message2";$x1;$y1;$MemoX;$y2;*)
	
	OBJECT GET COORDINATES:C663(*;"ThermoProgress";$x1;$y1;$x2;$y2)  //progress
	OBJECT MOVE:C664(*;"ThermoProgress";$x1;$y1;$MemoX;$y2;*)
	
End if 

  //  callback (updated only on change)

$ptrCallback:=OBJECT Get pointer:C1124(Object named:K67:5;"Callback")
$CurrentCallback:=$ptrCallback->

If ($CurrentCallback#$NewCallback)
	$ptrCallback->:=$NewCallback
End if 

