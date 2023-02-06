# Progress SET ON STOP METHOD

> Progress SET ON STOP METHOD ( id ; methodName )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| id  | Longint | ⬅️ | ID of progress bar |
| methodName | Text | ⬅️ | Name of stop method |
## Description

The **Progress SET ON STOP METHOD** method designates a method to execute when the user clicks on the **Stop** button of the progress bar.

By default, progress bars do not have **Stop** buttons. If you want a progress bar to have one, you must use the [Progress SET BUTTON ENABLED](Progress%20SET%20BUTTON%20ENABLED.md) method.

In `id`, you pass the unique ID of the progress bar, returned by the [Progress New](Progress%20New.md) method.

In `methodName`, you pass the name of the project method of the host database to be called when the **Stop** button is clicked. This method receives the unique ID of the progress bar as its first parameter. Then it is executed in a new process launched by the component.

**Note**: Since the **Progress SET ON STOP METHOD** method belongs to a component, you must remember to assign the "Shared by components and host database" property to the `methodName` method; otherwise an error is returned.

## See also

[Progress Get On Stop Method](Progress%20Get%20On%20Stop%20Method.md)
