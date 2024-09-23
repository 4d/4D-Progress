// var $NilPtr : Pointer
var $SubformWidth; $SubformHeight : Integer

Case of 
	: (Form event code:C388=On Load:K2:1)
		
		<>NbObjects:=1
		<>NbVisibleObjects:=1
		
	: (Form event code:C388=On Outside Call:K2:11)
		
		$SubformWidth:=400
		$SubformHeight:=68
		
		Progress__OnExternalCall($SubformWidth; $SubformHeight)
		
End case 