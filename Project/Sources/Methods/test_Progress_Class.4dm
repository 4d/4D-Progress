//%attributes = {"shared":true}
#DECLARE()

// Example usage of the Progress class

// Create a new progress bar
var $progress:=cs:C1710.Progress.new()

// Set initial title and message
$progress.setTitle("Processing files")
$progress.setMessage("Initializing...")

// Simulate some work with progress updates
var $i : Integer
For ($i; 1; 100)
	
	// Check if user clicked stop button
	If ($progress.isStopped())
		break
	End if 
	
	// Update progress
	$progress.setProgress($i/100; "Processing item "+String:C10($i))
	
	// Simulate work
	DELAY PROCESS:C323(Current process:C322; 5)  // 5 ticks delay
	
End for 

// Clean up
$progress.quit()

// ALERT("Progress demo completed!")
