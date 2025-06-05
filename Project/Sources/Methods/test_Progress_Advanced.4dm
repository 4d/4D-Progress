//%attributes = {"shared":true}
#DECLARE()

// Advanced example of the Progress class with stop button and custom styling

// Create a new progress bar with an existing ID (or create new if needed)
var $progress:=cs:C1710.Progress.new()

// Configure the progress bar appearance
$progress.setTitle("Advanced Progress Example")
$progress.setButtonEnabled(True:C214)  // Enable stop button
$progress.setButtonTitle("Cancel")


// Set custom fonts and sizes (these are global settings)
cs:C1710.ProgressDialog.me.setFonts("Arial"; "Arial"; "Arial")
cs:C1710.ProgressDialog.me.setFontSizes(12; 10; 10)

// Position the window and make it visible in foreground
cs:C1710.ProgressDialog.me.setWindowVisible(True:C214; 100; 100; True:C214)

var $shouldStop : Boolean
$shouldStop:=False:C215

// Process items with detailed progress tracking
var $i : Integer
For ($i; 1; 50)
	
	// Check if user requested to stop
	If ($progress.isStopped())
		$shouldStop:=True:C214
		break
	End if 
	
	// Update with detailed information
	var $percentage : Real
	$percentage:=$i/50
	$progress.setProgress($percentage; "Step "+String:C10($i)+" of 50 ("+String:C10(Round:C94($percentage*100; 0))+"% complete)")
	
	// Update the title to show current status
	$progress.setTitle("Processing: Item "+String:C10($i))
	
	// Simulate work
	DELAY PROCESS:C323(Current process:C322; 10)  // 10 ticks delay
	
End for 

// Final status
If ($shouldStop)
	$progress.setTitle("Operation Cancelled")
	$progress.setMessage("Processing was stopped by user")
Else 
	$progress.setTitle("Operation Complete")
	$progress.setMessage("All items processed successfully")
	$progress.setProgress(1)  // 100% complete
End if 

// Keep the final status visible for a moment
DELAY PROCESS:C323(Current process:C322; 120)  // 2 seconds

// Clean up
$progress.quit()

If ($shouldStop)
	// ALERT("Operation was cancelled by user.")
Else 
	// ALERT("Advanced progress demo completed successfully!")
End if 
