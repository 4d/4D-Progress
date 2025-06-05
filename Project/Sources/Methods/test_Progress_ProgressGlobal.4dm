//%attributes = {}
// Test method demonstrating both Progress and ProgressDialog classes

// Configure global settings for all progress bars
cs.ProgressDialog.me.setFonts("Arial"; "Times"; "Helvetica")
cs.ProgressDialog.me.setFontSizes(14; 12; 10)
cs.ProgressDialog.me.setWindowVisible(True:C214; 100; 50; True:C214)

// Create a new progress bar with the global settings applied
var $progress:=cs:C1710.Progress.new()

// Use the progress bar
$progress.setTitle("Processing with Global Settings")
$progress.setProgress(0.25; "25% complete")

DELAY PROCESS:C323(Current process:C322; 120)

$progress.setProgress(0.75; "75% complete")

DELAY PROCESS:C323(Current process:C322; 120)

$progress.setProgress(1; "Complete!")

DELAY PROCESS:C323(Current process:C322; 60)

// Clean up
$progress.quit()
