//%attributes = {"shared":true}
#DECLARE()

// Example showing multiple progress bars using the Progress class

var $progress1; $progress2 : cs:C1710.Progress

// Create first progress bar
$progress1:=cs:C1710.Progress.new()
$progress1.setTitle("Task 1: Data Processing")
$progress1.setMessage("Starting data processing...")

// Create second progress bar  
$progress2:=cs:C1710.Progress.new()
$progress2.setTitle("Task 2: File Operations")
$progress2.setMessage("Starting file operations...")

// Enable stop buttons for both
$progress1.setButtonEnabled(True:C214)
$progress2.setButtonEnabled(True:C214)

// Process both tasks simultaneously
var $completed1; $completed2 : Boolean
$completed1:=False:C215
$completed2:=False:C215
var $i : Integer
For ($i; 1; 30)
	
	// Update first progress bar (slower task)
	If (Not:C34($completed1))
		If ($progress1.isStopped())
			$completed1:=True:C214
		Else 
			$progress1.setProgress($i/30; "Processing data chunk "+String:C10($i))
			If ($i>=30)
				$completed1:=True:C214
			End if 
		End if 
	End if 
	
	// Update second progress bar (faster task)
	If (Not:C34($completed2))
		If ($progress2.isStopped())
			$completed2:=True:C214
		Else 
			var $progress2Value : Real
			$progress2Value:=($i*2)/30  // Goes twice as fast
			If ($progress2Value>1)
				$progress2Value:=1
				$completed2:=True:C214
			End if 
			$progress2.setProgress($progress2Value; "Processing file "+String:C10($i*2))
		End if 
	End if 
	
	// Break if both completed or stopped
	If ($completed1 & $completed2)
		break
	End if 
	
	// Simulate work
	DELAY PROCESS:C323(Current process:C322; 15)  // 15 ticks delay
	
End for 

// Clean up both progress bars
$progress1.quit()
$progress2.quit()

// ALERT("Multiple progress bars demo completed!")
