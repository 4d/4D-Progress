//%attributes = {"shared":true}
#DECLARE()

// Example showing how to wrap an existing progress ID with the Progress class

// First, create a progress bar using the traditional method
var $progressId:=Progress New

// Now wrap the existing ID with our Progress class
var $progress:=cs:C1710.Progress.new($progressId)

// Use the class methods to interact with the existing progress bar
$progress.setTitle("Wrapped Progress Bar")
$progress.setMessage("This progress bar was created traditionally, then wrapped in our class")
$progress.setProgress(0.5)  // 50% complete

// Show that we can still get the original ID
ALERT:C41("Progress ID: "+String:C10($progress.id))

// Wait a moment
DELAY PROCESS:C323(Current process:C322; 120)  // 2 seconds

// Clean up using the class method
$progress.quit()

// ALERT("Wrapped progress demo completed!")
