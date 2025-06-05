# Progress Class

A 4D class that wraps the Progress component functionality, providing an object-oriented interface for managing progress bars.

## Constructor

### `Progress.new()` 
Creates a new progress bar and returns a Progress instance.

### `Progress.new(progressId)`
Wraps an existing progress bar ID in a Progress class instance.

**Parameters:**
- `progressId` (Integer): An existing progress bar ID

## Properties

### `id` (Integer)
The unique identifier of the progress bar.

## Get Methods

### `getTitle() : Text`
Returns the current title of the progress bar.

### `getMessage() : Text` 
Returns the current message of the progress bar.

### `getProgress() : Real`
Returns the current progress value (0-1 or -1 for indeterminate).

### `getIcon() : Picture`
Returns the current icon of the progress bar.

### `getButtonEnabled() : Boolean`
Returns True if the stop button is enabled.

### `getButtonTitle() : Text`
Returns the title of the stop button (Windows only).

### `getOnStopMethod() : Text`
Returns the name of the method called when stop button is clicked.

### `isStopped() : Boolean`
Returns True if the user clicked the stop button.

## Set Methods

### `setTitle(title; progress; message; foreground)`
Sets the title and optionally progress and message.

**Parameters:**
- `title` (Text): The main title text
- `progress` (Real, optional): Progress value (0-1 or -1)
- `message` (Text, optional): Additional message text
- `foreground` (Boolean, optional): Bring to foreground

### `setMessage(message; foreground)`
Sets the progress bar message.

**Parameters:**
- `message` (Text): The message text
- `foreground` (Boolean, optional): Bring to foreground

### `setProgress(progress; message; foreground)`
Sets the progress value and optionally message.

**Parameters:**
- `progress` (Real): Progress value (0-1 or -1 for indeterminate)
- `message` (Text, optional): Additional message text
- `foreground` (Boolean, optional): Bring to foreground

### `setIcon(icon; foreground)`
Sets the progress bar icon.

**Parameters:**
- `icon` (Picture): The icon picture
- `foreground` (Boolean, optional): Bring to foreground

### `setButtonEnabled(enabled; foreground)`
Enables or disables the stop button.

**Parameters:**
- `enabled` (Boolean): True to show stop button
- `foreground` (Boolean, optional): Bring to foreground

### `setButtonTitle(title; foreground)`
Sets the stop button title (Windows only).

**Parameters:**
- `title` (Text): The button title
- `foreground` (Boolean, optional): Bring to foreground

### `setOnStopMethod(methodName; foreground)`
Sets the method to call when stop button is clicked.

**Parameters:**
- `methodName` (Text): Name of the method to call
- `foreground` (Boolean, optional): Bring to foreground

## Utility Methods

### `quit()`
Closes and removes the progress bar.

## Related Classes

The Progress class works with the **ProgressDialog** singleton class for global settings. See ProgressDialog documentation for font, window, and error handling configuration.

## Usage Examples

### Basic Usage
```4d
var $progress : cs.Progress
$progress:=cs.Progress.new()
$progress.setTitle("Processing...")
$progress.setProgress(0.5; "50% complete")
$progress.quit()
```

### With Stop Button
```4d
var $progress : cs.Progress
$progress:=cs.Progress.new()
$progress.setButtonEnabled(True)

For ($i; 1; 100)
    If ($progress.isStopped())
        break
    End if
    $progress.setProgress($i/100; "Item "+String($i))
End for

$progress.quit()
```

### Wrapping Existing Progress
```4d
var $id : Integer
$id:=Progress New

var $progress : cs.Progress
$progress:=cs.Progress.new($id)
$progress.setTitle("Wrapped Progress")
$progress.quit()
```

### Multiple Progress Bars
```4d
var $progress1; $progress2 : cs.Progress
$progress1:=cs.Progress.new()
$progress2:=cs.Progress.new()

$progress1.setTitle("Task 1")
$progress2.setTitle("Task 2")

// ... update both as needed ...

$progress1.quit()
$progress2.quit()
```

### Using Global Settings with ProgressDialog
```4d
// Configure global settings
cs.ProgressDialog.me.setFonts("Arial"; "Times")
cs.ProgressDialog.me.setFontSizes(14; 12)
cs.ProgressDialog.me.setWindowVisible(True; 100; 50)

// Create progress with global settings applied
var $progress:=cs.Progress.new()
$progress.setTitle("Processing with Custom Fonts")
$progress.setProgress(0.5; "50% complete")
$progress.quit()
```
