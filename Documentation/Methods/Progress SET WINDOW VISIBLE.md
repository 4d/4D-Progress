# Progress SET WINDOW VISIBLE

> Progress SET WINDOW VISIBLE ( visible {; horPos ; vertPos {; foreground}} )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| visible | Boolean | ⬅️ | True = Show, False = Hide |
| horPos | Longint | ⬅️ | Left coordinate of window  <br>-1 = No change |
| vertPos | Longint | ⬅️ | Top coordinate of window  <br>-1 = No change |
| foreground | Boolean | ⬅️ | Show progress bar in foreground |
## Description

The **Progress SET WINDOW VISIBLE** method manages the display of the progress bar window, if it exists.

The [visible](## "True = Show, False = Hide") parameter indicates whether or not the window is visible (by default, it is visible). Pass False in this parameter to hide the window and True to show it again, if it exists.

The [horPos](## "Left coordinate of window")
- 1 = No change") and [vertPos](# "Top coordinate of window)
- 1 = No change") parameters modify the location of the progress bar window on screen. In these parameters, you pass values representing the movement in pixels to the right ([horPos](# "Left coordinate of window")
- 1 = No change")) or downwards ([vertPos](## "Top coordinate of window" )
- 1 = No change")) with respect to the coordinates of the main application window (under Windows) or the screen (under Mac OS).

When you do not want to modify these coordinates (for instance, if you want to use the `foreground`  parameter without changing the position of the window), pass -1 to each of these parameters.

Pass True in `foreground` when you want to force the progress window to the foreground of the application.

### Example 1  

Place the progress bar window 50 pixels from the left edge and 100 pixels from the top edge:

```4d
 Progress SET WINDOW VISIBLE(True;50;100)
```

### Example 2  

Hide the progress bar window:

```4d
 Progress SET WINDOW VISIBLE(False)
```

### Example 3  

Display the progress bar window and move it to the foreground without changing its position:

```4d
 Progress SET WINDOW VISIBLE(True;-1;-1;True)
```
