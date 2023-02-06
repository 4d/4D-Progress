# Progress SET BUTTON TITLE

> Progress SET BUTTON TITLE ( id ; title )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| id  | Longint | ⬅️ | ID of progress bar |
| title | Text | ⬅️ | Title of Stop button (Windows) |
## Description

**Note**: This method can only be used under Windows. Under Mac OS, stop buttons do not have titles.

The **Progress SET BUTTON TITLE** method changes the title of the **Stop** button for the progress bar designated by the `id` parameter. By default, the title of this button is "Stop":

![](https://doc.4d.com/4Dv19/picture/925149/pict925149.en.png)

By default, progress bars do not have **Stop** buttons. If you want a progress bar to have one, you must use the [Progress SET BUTTON ENABLED](Progress%20SET%20BUTTON%20ENABLED.md) method.

### Example  

You want to use the title "Abort":

```4d
 <>ID:=Progress New  
 ...  
 Progress SET BUTTON TITLE(<>ID;"Abort")
```

![](https://doc.4d.com/4Dv19/picture/925156/pict925156.en.png)

## See also

[Progress Get Button Title](Progress%20Get%20Button%20Title.md)
