# Progress SET ICON

> Progress SET ICON ( id ; icon {; foreground} )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| id  | Longint | ⬅️ | ID of progress bar |
| icon | Picture | ⬅️ | Picture to display as icon |
| foreground | Boolean | ⬅️ | Show progress bar in foreground |
## Description

The **Progress SET ICON** method modifies the icon displayed in the progress bar. By default, the following icons are displayed:

![](https://doc.4d.com/4Dv19/picture/925372/pict925372.en.png)

In `id`, you pass the unique ID of the progress bar, returned by the [Progress New](Progress%20New.md) method.

In [icon](# "Picture to display as icon"), you pass the picture (variable or field) to use as the icon in the progress bar window. The maximum size of this icon must be:

* under Mac OS, 40 x 40 pixels
* under Windows, 40 x 80 pixels

If you pass an icon with a size that is smaller than these limits, it is centered but not resized. However, when its size exceeds these limits, it is both centered and resized.

Pass True in `foreground`when you want to force the progress window to the foreground of the application.

Examples of custom icons:

![](https://doc.4d.com/4Dv19/picture/925400/pict925400.en.png)

## See also

[Progress Get Icon](Progress%20Get%20Icon.md)
