# Progress Stopped

> Progress Stopped ( id ) -> Function result

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| id  | Longint | ⬅️ | ID of progress bar |
| Function result | Boolean | ➡️ | True = User clicked the Stop button |
## Description

The **Progress Stopped** method returns True when a user clicks on the **Stop** button of the progress bar designated by the `id` parameter.

You must call this method to test whether the user clicked the **Stop** button. The button does not trigger an event itself.

### Example  

Example of progress bar on a loop:

```4d
 $ProgressID:=Progress New // create a new progress bar  
  // The progress bar must have a Stop button  
 Progress SET BUTTON ENABLED($ProgressID;True)  
 For($i;1;100)  
  // As long as progress is not stopped...  
    If(Not(Progress Stopped($ProgressID)))  
       Progress SET TITLE($ProgressID;"Test progress #"+String($ProgressID))  
       Progress SET PROGRESS($ProgressID;$i/100)  
       Progress SET MESSAGE($ProgressID;String(100*$i/100)+" %")  
       (...)  
    Else // The user clicks on Stop  
       $i:=100 // We exit the loop  
    End if  
 End for  
  // Final closing of progress bar (the Stop button itself does nothing)  
 Progress QUIT($ProgressID)
```
