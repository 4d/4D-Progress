# Progress SET ON ERROR METHOD

> Progress SET ON ERROR METHOD ( methodName )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| methodName | Text | ⬅️ | Name of error method |
## Description

The **Progress SET ON ERROR METHOD** method designates a method to execute in the event of an error when using progress bars (for example id unknown, incorrect number of parameters, etc.).

In [methodName](# "Name of error method"), you pass the name of the project method of the host database to be called in the event of an error. This method is shared by all the progress windows of the application.

**Note**: Since the **Progress SET ON ERROR METHOD** method belongs to a component, you must remember to assign the "Shared by components and host database" property to the [methodName](# "Name of error method") method; otherwise an error is returned.

The [methodName](# "Name of error method") method is called with three parameters:

* $1 (Longint): error number
* $2 (Text): text of the error
* $3 (Longint): unique ID of progress bar

### Example  

Here is an example of a method called in the event of an error. This method is declared as "shared" in Design mode:

```4d
 C_LONGINT($1)  
 C_TEXT($2)  
 C_LONGINT($3)  
   
 C_LONGINT($ErrorID)  
 C_TEXT($ErrorText)  
 C_LONGINT($ProgressID)  
   
 $ErrorID:=$1  
 $ErrorText:=$2  
 $ProgressID:=$3  
 $Error:=""  
 $Error:=$Error+"Error number: "+String($ErrorID)+Char(Carriage return)  
 $Error:=$Error+$ErrorText+Char([Carriage return](/4Dv19/4D/19/ASCII-Codes.302-5393287.en.html "Carriage return"))  
 $Error:=$Error+"Progress ID: "+String($ProgressID)  
 ALERT($Error)
```

## See also

[Progress Get On Error Method](Progress%20Get%20On%20Error%20Method.md)
