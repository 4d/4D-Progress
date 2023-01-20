//%attributes = {"invisible":true}

C_LONGINT:C283($1; $2)

C_LONGINT:C283($x1; $y1; $x2; $y2)
C_LONGINT:C283($SubformWidth; $SubformHeight)
C_LONGINT:C283($FormHeight)

C_LONGINT:C283($i; $n; $p)
C_LONGINT:C283($ID)
C_LONGINT:C283($Target)

C_POINTER:C301($NilPtr)
C_POINTER:C301($Ptr)

C_TEXT:C284($SubFormName)
C_LONGINT:C283($VerticalCenter)


$SubformWidth:=$1
$SubformHeight:=$2

Progress__Semaphore_ON  //***************************************

$n:=Size of array:C274(<>_ProgressID)

If (<>NbObjects<$n)
	For ($i; 2; $n)
		$SubFormName:="Subform"+String:C10($i)
		$Ptr:=OBJECT Get pointer:C1124(Object named:K67:5; $SubFormName)
		If (Is nil pointer:C315($Ptr))
			OBJECT GET COORDINATES:C663(*; "Subform1"; $x1; $y1; $x2; $y2)  //current width of the #1 subform
			OBJECT DUPLICATE:C1111(*; "Subform1"; $SubFormName; $NilPtr; ""; 0; 0; $SubformWidth; $SubformHeight; *)
			OBJECT MOVE:C664(*; $SubFormName; $x1; $SubformHeight*($i-1); $x2; $SubformHeight*$i; *)
			<>NbObjects:=<>NbObjects+1
		End if 
	End for 
End if 


If ($n=0)
	
	CANCEL:C270  //   <<<<<<<<<< exit dial
	
Else 
	
	If (<>NbVisibleObjects#$n)  // MUST RESIZE WINDOW
		
		<>NbVisibleObjects:=$n
		$SubformHeight:=$SubformHeight*<>NbVisibleObjects
		
		GET WINDOW RECT:C443($x1; $y1; $x2; $y2)
		$VerticalCenter:=($y1+$y2)/2
		
		//ACI0098693
		If (Is Windows:C1573)
			
			Case of 
				: ($VerticalCenter=<>VerticalCenter)
					//window has NOT been moved by the user
					//window grows symetricaly upwards and downwards
					$y1:=$VerticalCenter-($SubformHeight/2)
					
				: ($VerticalCenter<<>VerticalCenter)
					//window HAS been moved upwards by the user
					//window grows downwards
					$y1:=$y1  // do nothing
					
				: ($VerticalCenter><>VerticalCenter)
					//window HAS been moved downwards by the user
					//window grows upwards
					$y1:=$y2-$SubformHeight
			End case 
			
			$y2:=$y1+$SubformHeight
			
		Else 
			//mac platfom : always grow downwards
			$y2:=$y1+$SubformHeight
			
			//$DeltaX:=0
			//$DeltaY:=$SubformHeight-($y2-$y1)  // new height - current height
			
		End if 
		
		SET WINDOW RECT:C444($x1; $y1; $x2; $y2)
		
		//RESIZE FORM WINDOW($DeltaX;$DeltaY)
		//FORM SET VERTICAL RESIZING(False)
		
	End if 
	
	// UPDATE THERMO
	$Target:=0  // id of the subform object
	$p:=0  // row of valid progress in array
	Repeat 
		$p:=Find in array:C230(<>_ProgressCanceled; False:C215; $p+1)
		If ($p>0)
			$Target:=$Target+1  // next object in form
			
			$ID:=<>_ProgressID{$p}
			$SubFormName:="Subform"+String:C10($target)
			
			If (<>UpdateFonts)
				EXECUTE METHOD IN SUBFORM:C1085($SubFormName; "Progress__UpdateFonts")
				<>_ProgressUpdated{$p}:=True:C214  // forces the last update
			End if 
			
			If (<>UpdateSizes)
				EXECUTE METHOD IN SUBFORM:C1085($SubFormName; "Progress__UpdateSizes")
				<>_ProgressUpdated{$p}:=True:C214  // forces the last update
			End if 
			
			If (<>_ProgressUpdated{$p}=True:C214)  // has this valid progress been updated ?
				EXECUTE METHOD IN SUBFORM:C1085($SubFormName; "Progress__UpdateDynVar"; *; $ID)
				<>_ProgressUpdated{$p}:=False:C215
			End if 
			
		End if 
	Until ($p<=0)
	
	<>UpdateFonts:=False:C215
	<>UpdateSizes:=False:C215
	
End if 

Progress__Semaphore_OFF  //***************************************

