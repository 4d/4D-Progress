# Progress SET TITLE  

> Progress SET TITLE ( id ; title {; progress {; message {; foreground}}} )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| id  | Longint | ⬅️ | ID of progress bar |
| title | Text | ⬅️ | Title of progress bar |
| progress | Real | ⬅️ | Value of progress (\[0...1\] or -1) |
| message | Text | ⬅️ | Message of progress bar |
| foreground | Boolean | ⬅️ | Show progress bar in foreground |
## Description

The **Progress SET TITLE** method sets the title of the progress bar along with the information displayed in the progress bar window.

In `id`, you pass the unique ID of the progress bar, returned by the [Progress New](Progress%20New.md) method.

In `title`, you pass the main text to display in the progress bar window.

In `progress`, you pass the current value of the progress bar (optional). You can pass a Real value (between 0 and 1) or -1 to specify an undefined progress bar (also known as a "Barber shop" bar under Mac OS).

In `message`, you pass additional text to display under the main title (Windows) or under the progress bar (Mac OS). This parameter is optional.

Pass True in `foreground`when you want to force the progress window to the foreground of the application.

### Example  

Creating a simple progress bar window:

```4d
 $P:=Progress New  
 Progress SET TITLE($P;"Copying folder";-1;"Counting files")
```

![](https://doc.4d.com/4Dv19/picture/926902/pict926902.en.png)

## See also

[Progress Get Title](Progress%20Get%20Title.md)
