# Progress SET MESSAGE

> Progress SET MESSAGE ( id ; message {; foreground} )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| id  | Longint | ⬅️ | ID of progress bar |
| message | Text | ⬅️ | Message of progress bar |
| foreground | Boolean | ⬅️ | Show progress bar in foreground |
## Description

The **Progress SET MESSAGE** method changes the message shown in the progress bar.

In `id`, you pass the unique ID of the progress bar, returned by the [Progress New](Progress%20New.md) method.

In `message`, you pass the text you want to modify under the main title (Windows) or under the progress bar (Mac OS).

Pass True in `foreground`when you want to force the progress window to the foreground of the application.

## See also

[Progress Get Message](Progress%20Get%20Message.md)
