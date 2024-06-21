//%attributes = {"invisible":true}
// Modifiée le 24 nov 2010 par RL
// Fenetre centrée verticalement sur windows
// Type de fenetre modifiée (avec case de reduction)
#DECLARE($runnerFlag : Integer)

var $form : Text
var $height; $width; $left; $right; $top; $bottom : Integer

If (Count parameters:C259=0)
	
	If (<>PS_Progress=0)
		
		<>PS_Progress:=New process:C317(Formula:C1597(Progress__Launch).source; 0; "$ProgressBar"; 0)  // ACI0100926 (128000 instead of 64000)
		DELAY PROCESS:C323(Current process:C322; 15)  // 1/4 de seconde
		
	End if 
	
	return 
	
End if 

// ACI0098693
If (Is Windows:C1573)
	
	$form:="D_Multiprogress_Win"
	FORM GET PROPERTIES:C674($form; $width; $height)
	
	$left:=(Screen width:C187\2)-($width\2)
	$top:=(Screen height:C188-$height)\2
	$bottom:=$top+$height
	
	<>ProgressWindow:=Open form window:C675($form; Plain fixed size window:K34:6+Form has no menu bar:K39:18; $left; $top)
	<>VerticalCenter:=($top+$bottom)\2
	
Else 
	
	$form:="D_Multiprogress_Mac"
	FORM GET PROPERTIES:C674($form; $width; $height)
	
	$left:=(Screen width:C187\2)-($width\2)
	$top:=80+Tool bar height:C1016
	$bottom:=$top+$height
	
	<>ProgressWindow:=Open form window:C675($form; Plain fixed size window:K34:6*(-1); $left; $top)
	<>VerticalCenter:=$left
	
End if 

DIALOG:C40($form)
CLOSE WINDOW:C154

<>PS_Progress:=0
