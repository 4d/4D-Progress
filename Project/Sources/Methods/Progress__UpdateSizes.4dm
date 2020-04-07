//%attributes = {"invisible":true}
If (<>SizeMessage1>0)
	OBJECT SET FONT SIZE:C165(*;"Message1";<>SizeMessage1)
End if 

If (<>SizeMessage2>0)
	OBJECT SET FONT SIZE:C165(*;"Message2";<>SizeMessage2)
End if 

If (<>SizeStopButton>0)
	OBJECT SET FONT SIZE:C165(*;"StopButton";<>SizeStopButton)
End if 
