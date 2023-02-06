# Progress QUIT

> Progress QUIT ( id )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| id  | Longint | ⬅️ | ID of progress bar |
## Description

The **Progress QUIT** method closes the progress bar referenced by the `id` parameter.

If `id` designates the only progress bar displayed, the progress window is also closed (as well as the local process). Otherwise, the window is resized so that it only contains the progress bars that are still open.

You can pass 0 in the `id` parameter in order to stop all the progress bars and close the progress window.

### Example  

If the bar named "Copying folder 3" has the ID number 3:

```4d
 Progress QUIT(3)
```

![](https://doc.4d.com/4Dv19/picture/924963/pict924963.en.png)

If a progress window is already open when this method is called, this window is resized so that it shows a new progress bar under the previous one(s) in the same process:

![](https://doc.4d.com/4Dv19/picture/925049/pict925049.en.png)
