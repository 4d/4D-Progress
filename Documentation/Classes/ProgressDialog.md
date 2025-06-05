# ProgressDialog Class

A singleton class for managing global settings that apply to all Progress bars in the application.

## Overview

The ProgressDialog class provides a centralized way to configure font settings, window appearance, and error handling for all progress bars. It implements the singleton pattern, ensuring only one instance exists per application.

## Constructor

### `ProgressDialog.new()`
Returns the singleton instance of ProgressDialog. Multiple calls return the same instance.

## Font Settings

### `setFonts(fontTitles; fontMessages; fontButtons)`
Sets fonts for different elements of progress bars.

**Parameters:**
- `fontTitles` (Text): Font for progress bar titles
- `fontMessages` (Text, optional): Font for progress messages
- `fontButtons` (Text, optional): Font for stop buttons

**Examples:**
```4d
$global.setFonts("Arial")                    // Only titles
$global.setFonts("Arial"; "Times")           // Titles and messages  
$global.setFonts("Arial"; "Times"; "Courier") // All elements
```

### `setFontSizes(sizeTitles; sizeMessages; sizeButtons)`
Sets font sizes for different elements of progress bars.

**Parameters:**
- `sizeTitles` (Integer): Size for progress bar titles
- `sizeMessages` (Integer, optional): Size for progress messages
- `sizeButtons` (Integer, optional): Size for stop buttons

**Examples:**
```4d
$global.setFontSizes(14)              // Only titles
$global.setFontSizes(14; 12)          // Titles and messages
$global.setFontSizes(14; 12; 10)      // All elements
```

## Window Settings

### `setWindowVisible(visible; horPos; vertPos; foreground)`
Controls the visibility and position of progress bar windows.

**Parameters:**
- `visible` (Boolean): Show or hide progress windows
- `horPos` (Integer, optional): Horizontal position (-1 = no change)
- `vertPos` (Integer, optional): Vertical position (-1 = no change)  
- `foreground` (Boolean, optional): Bring windows to foreground

**Examples:**
```4d
$global.setWindowVisible(True)                    // Show windows
$global.setWindowVisible(True; 100; 50)           // Show at position
$global.setWindowVisible(True; 100; 50; True)     // Show in foreground
$global.setWindowVisible(False)                   // Hide windows
```

## Error Handling

### `setOnErrorMethod(methodName)`
Sets a global error handling method for all progress bars.

**Parameters:**
- `methodName` (Text): Name of the method to call on errors

### `getOnErrorMethod() : Text`
Returns the name of the current global error handling method.

## Usage Examples

### Basic Global Configuration
```4d
// Set consistent fonts across all progress bars
cs.ProgressDialog.me.setFonts("System"; "System"; "System")
cs.ProgressDialog.me.setFontSizes(14; 12; 10)

// Position windows in top-right corner
$global.setWindowVisible(True; 500; 50; True)
```

### Error Handling Setup
```4d 
// Set global error handler
cs.ProgressDialog.me.setOnErrorMethod("ProgressErrorHandler")

// Check current error method
var $errorMethod:=cs.ProgressDialog.me.getOnErrorMethod()
```

### Complete Setup with Progress Bars
```4d
// Configure global settings first 
cs.ProgressDialog.me.setFonts("Arial"; "Times New Roman")
cs.ProgressDialog.me.setFontSizes(16; 12)
cs.ProgressDialog.me.setWindowVisible(True; 200; 100)

// Create progress bars - they inherit global settings
var $progress1:=cs.Progress.new()
$progress1.setTitle("First Task")

var $progress2:=cs.Progress.new()  
$progress2.setTitle("Second Task")

// Both progress bars use the same fonts and positioning
$progress1.setProgress(0.5; "Processing...")
$progress2.setProgress(0.3; "Loading...")

$progress1.quit()
$progress2.quit()
```

## Notes

- ProgressDialog is a singleton
- Global settings apply to all subsequently created Progress instances
- Settings persist until explicitly changed or the application restarts
- Font and size settings affect the visual appearance across all platforms
- Window positioning is particularly useful for consistent UI placement
