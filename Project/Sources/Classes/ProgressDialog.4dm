// ProgressDialog class - Global settings for all Progress bars
singleton Class constructor

Function new(): cs.Progress
	return cs.Progress.new()
	
	// MARK: - Font settings
Function setFonts($fontTitles : Text; $fontMessages : Text; $fontButtons : Text)
	Case of 
		: (Count parameters:C259=1)
			Progress SET FONTS($fontTitles)
		: (Count parameters:C259=2)
			Progress SET FONTS($fontTitles; $fontMessages)
		: (Count parameters:C259=3)
			Progress SET FONTS($fontTitles; $fontMessages; $fontButtons)
	End case 
	
Function setFontSizes($sizeTitles : Integer; $sizeMessages : Integer; $sizeButtons : Integer)
	Case of 
		: (Count parameters:C259=1)
			Progress SET FONT SIZES($sizeTitles)
		: (Count parameters:C259=2)
			Progress SET FONT SIZES($sizeTitles; $sizeMessages)
		: (Count parameters:C259=3)
			Progress SET FONT SIZES($sizeTitles; $sizeMessages; $sizeButtons)
	End case 
	
	// MARK: - Window settings
Function setWindowVisible($visible : Boolean; $horPos : Integer; $vertPos : Integer; $foreground : Boolean)
	Case of 
		: (Count parameters:C259=1)
			Progress SET WINDOW VISIBLE($visible)
		: (Count parameters:C259=2)
			Progress SET WINDOW VISIBLE($visible; $horPos)
		: (Count parameters:C259=3)
			Progress SET WINDOW VISIBLE($visible; $horPos; $vertPos)
		: (Count parameters:C259=4)
			Progress SET WINDOW VISIBLE($visible; $horPos; $vertPos; $foreground)
	End case 
	
	// MARK: - Error handling
Function setOnErrorMethod($methodName : Text)
	Progress SET ON ERROR METHOD($methodName)
	
Function getOnErrorMethod() : Text
	return Progress Get On Error Method
	