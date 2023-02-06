# Progress SET BUTTON ENABLED

> Progress SET BUTTON ENABLED ( id ; button )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| id  | Longint | ⬅️ | ID of progress bar |
| button | Boolean | ⬅️ | True = Show, False = Hide |
## Description

The **Progress SET BUTTON ENABLED** method adds a **Stop** button to the progress bar designated by the `id` parameter.

By default, progress bars do not have **Stop** buttons. If you pass True in the [button](# "True = Show, False = Hide") parameter, then a button is displayed:

![](https://doc.4d.com/4Dv19/picture/925113/pict925113.en.png)

You must manage the effect of clicking on this **Stop** button using the [Progress SET ON STOP METHOD](Progress%20SET%20ON%20STOP%20METHOD.md) method or by testing the value of the [Progress Stopped](Progress%20Stopped.md) method.

## See also

[Progress Get Button Enabled](Progress%20Get%20Button%20Enabled.md)
