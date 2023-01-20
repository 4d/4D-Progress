C_POINTER:C301($NilPtr)
C_LONGINT:C283($SubformWidth; $SubformHeight)

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		<>NbObjects:=1
		<>NbVisibleObjects:=1
		
	: (Form event code:C388=On Outside Call:K2:11)
		
		$SubformWidth:=400
		$SubformHeight:=120
		
		Progress__OnExternalCall($SubformWidth; $SubformHeight)
		
End case 