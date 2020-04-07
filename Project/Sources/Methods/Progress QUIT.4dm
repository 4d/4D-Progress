//%attributes = {"invisible":true,"shared":true}
  // should be called by host before leaving

C_LONGINT:C283($1)  //Reference of Progress to stop

C_LONGINT:C283($ErrorID)  //Error code
C_LONGINT:C283($ProgressID)  // progress code

C_LONGINT:C283($i;$p;$n)
C_TEXT:C284($Error)

$Error:=""

If (Count parameters:C259>=1)
	
	Progress__Semaphore_ON   //*************
	
	$ProgressID:=$1
	
	If ($ProgressID=0)
		
		<>ProgressInited:=False:C215
		Progress__Compiler   //used to reset arrays
		
	Else 
		
		$n:=Size of array:C274(<>_ProgressID)
		$p:=Find in array:C230(<>_ProgressID;$ProgressID)
		
		If ($p>0)
			
			DELETE FROM ARRAY:C228(<>_ProgressID;$p;1)
			DELETE FROM ARRAY:C228(<>_ProgressTitle;$p;1)
			DELETE FROM ARRAY:C228(<>_ProgressValue;$p;1)
			DELETE FROM ARRAY:C228(<>_ProgressMessage;$p;1)
			DELETE FROM ARRAY:C228(<>_ProgressIcon;$p;1)
			DELETE FROM ARRAY:C228(<>_ProgressOnStop;$p;1)
			DELETE FROM ARRAY:C228(<>_ProgressUpdated;$p;1)
			DELETE FROM ARRAY:C228(<>_ProgressCancelAllow;$p;1)
			DELETE FROM ARRAY:C228(<>_ProgressCanceled;$p;1)
			DELETE FROM ARRAY:C228(<>_ProgressCancelButtonText;$p;1)
			
			  // we consider that all next have been updated (shift down)
			  // including the previous one if the last one has been deleted
			
			$n:=$n-1  //number of line decreases
			
			If ($p>$n)  //last line deleted
				$p:=$p-1  //the last one is now the one that used to be before the last one
			Else   // any other line deleted
				  // if we have deleted the 50th line, the previous 51th shall becode the 50th one, so $p does not change
			End if 
			
			  //For ($i;$p;$n)
			For ($i;1;$n)
				<>_ProgressUpdated{$i}:=True:C214
			End for 
			
		Else 
			$ErrorID:=1  //bad ID
		End if 
		
	End if 
	
	Progress__Semaphore_OFF   //*************
	
	If ($ErrorID=0)
		
		POST OUTSIDE CALL:C329(<>PS_Progress)
		
		If (Count parameters:C259>=2)
			BRING TO FRONT:C326(<>PS_Progress)
		End if 
		
	End if 
	
Else 
	$ErrorID:=2  // wrong number of parameters
End if 

Progress__ManageMethodsError ($ErrorID;$ProgressID)



