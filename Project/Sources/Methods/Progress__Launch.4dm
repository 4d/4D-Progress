//%attributes = {"invisible":true}
// modifiée le 24 nov 2010 par RL
// fenetre centrée verticalement sur windows
// type de fenetre modifiée (avec case de reduction)

C_LONGINT:C283($0)  //recursive call
C_LONGINT:C283($1)  //recursive indicator

C_PICTURE:C286($Image)
C_LONGINT:C283($PS_Progress; $ProgressWindow)

C_LONGINT:C283($SubformWidth; $SubformHeight)
C_LONGINT:C283($x1; $y1; $x2; $y2)
C_LONGINT:C283($Width; $Height; $WinPosX; $WinPosY)

C_LONGINT:C283(<>PS_Progress)
C_LONGINT:C283(<>VerticalCenter)

If (Count parameters:C259=0)
	
	If (<>PS_Progress=0)
		<>PS_Progress:=New process:C317("Progress__Launch"; 128000; "$ProgressBar"; 0)  //ACI0100926  (128000 instead of 64000)
		DELAY PROCESS:C323(Current process:C322; 15)  // 1/4 de seconde
	End if 
	
Else 
	
	//ACI0098693
	If (Is Windows:C1573)
		
		$SubformWidth:=400
		$SubformHeight:=120
		
		$x1:=(Screen width:C187/2)-($SubformWidth/2)
		$y1:=(Screen height:C188-$SubformHeight)/2
		$x2:=$x1+$SubformWidth
		$y2:=$y1+$SubformHeight
		
		<>ProgressWindow:=Open window:C153($x1; $y1; $x2; $y2; Plain fixed size window:K34:6)
		<>VerticalCenter:=($y1+$y2)/2
		
		DIALOG:C40("D_Multiprogress_Win")
		
	Else 
		
		
		
		$SubformWidth:=400
		$SubformHeight:=68
		
		$x1:=(Screen width:C187/2)-($SubformWidth/2)
		$y1:=80+Tool bar height:C1016
		$x2:=$x1+$SubformWidth
		$y2:=$y1+$SubformHeight
		
		//<>ProgressWindow:=Open window($x1;$y1;$x2;$y2;Plain fixed size window)  //   ACI0098693 +_ o _ Compositing mode)
		
		//<>ProgressWindow:=Open window($x1;$y1;$x2;$y2;Palette window*(-1))
		<>ProgressWindow:=Open window:C153($x1; $y1; $x2; $y2; Plain fixed size window:K34:6*(-1))
		<>VerticalCenter:=$x1
		
		DIALOG:C40("D_Multiprogress_Mac")
		
	End if 
	
	CLOSE WINDOW:C154
	
	<>PS_Progress:=0
	
End if 
