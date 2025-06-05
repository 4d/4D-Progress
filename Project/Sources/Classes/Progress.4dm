property id: Integer
 
Class constructor($progressId : Integer)
	
	If (Count parameters:C259>=1)
		This.id:=$progressId
	Else 
		// Create a new progress bar if no ID provided
		This.id:=Progress New
	End if 
 
// MARK: - Get methods
Function getTitle() : Text
	return Progress Get Title(This.id)

Function getMessage() : Text
	return Progress Get Message(This.id)

Function getProgress() : Real
	return Progress Get Progress(This.id)

Function getIcon() : Picture
	return Progress Get Icon(This.id)

Function getButtonEnabled() : Boolean
	return Progress Get Button Enabled(This.id)

Function getButtonTitle() : Text
	return Progress Get Button Title(This.id)

Function getOnStopMethod() : Text
	return Progress Get On Stop Method(This.id)

Function isStopped() : Boolean
	return Progress Stopped(This.id)

// MARK: -  Set methods with optional foreground parameter
Function setTitle($title : Text; $progress : Real; $message : Text; $foreground : Boolean)
	Case of 
		: (Count parameters:C259=1)
			Progress SET TITLE(This.id; $title)
		: (Count parameters:C259=2)
			Progress SET TITLE(This.id; $title; $progress)
		: (Count parameters:C259=3)
			Progress SET TITLE(This.id; $title; $progress; $message)
		: (Count parameters:C259=4)
			Progress SET TITLE(This.id; $title; $progress; $message; $foreground)
	End case 

Function setMessage($message : Text; $foreground : Boolean)
	If (Count parameters:C259=1)
		Progress SET MESSAGE(This.id; $message)
	Else 
		Progress SET MESSAGE(This.id; $message; $foreground)
	End if 

Function setProgress($progress : Real; $message : Text; $foreground : Boolean)
	Case of 
		: (Count parameters:C259=1)
			Progress SET PROGRESS(This.id; $progress)
		: (Count parameters:C259=2)
			Progress SET PROGRESS(This.id; $progress; $message)
		: (Count parameters:C259=3)
			Progress SET PROGRESS(This.id; $progress; $message; $foreground)
	End case 

Function setIcon($icon : Picture; $foreground : Boolean)
	If (Count parameters:C259=1)
		Progress SET ICON(This.id; $icon)
	Else 
		Progress SET ICON(This.id; $icon; $foreground)
	End if 

Function setButtonEnabled($enabled : Boolean; $foreground : Boolean)
	If (Count parameters:C259=1)
		Progress SET BUTTON ENABLED(This.id; $enabled)
	Else 
		Progress SET BUTTON ENABLED(This.id; $enabled; $foreground)
	End if 

Function setButtonTitle($title : Text; $foreground : Boolean)
	If (Count parameters:C259=1)
		Progress SET BUTTON TITLE(This.id; $title)
	Else 
		Progress SET BUTTON TITLE(This.id; $title; $foreground)
	End if 

Function setOnStopMethod($methodName : Text; $foreground : Boolean)
	If (Count parameters:C259=1)
		Progress SET ON STOP METHOD(This.id; $methodName)
	Else 
		Progress SET ON STOP METHOD(This.id; $methodName; $foreground)
	End if 

// MARK: - Utility methods
Function quit()
	Progress QUIT(This.id) 


