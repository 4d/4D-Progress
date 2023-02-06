# Progress New

> Progress New -> Function result

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| Function result | Longint | ➡️ | ID of new progress bar |
## Description

The **Progress New** method creates a new progress bar and returns its ID number. This number is unique throughout the duration of the progress bar but can be reused subsequently.

The first time this method is called, a local process is created and a new centered window is opened above the main window. By default, this window:

* contains an undefined progress bar
* does not have a message.

![](https://doc.4d.com/4Dv19/picture/924605/pict924605.en.png)
