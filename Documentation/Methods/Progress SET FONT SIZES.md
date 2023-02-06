# Progress SET FONT SIZES

> Progress SET FONT SIZES ( sizeTitles {; sizeMessages {; sizeButtons}} )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| sizeTitles | Longint | ⬅️ | Size of font for titles |
| sizeMessages | Longint | ⬅️ | Size of font for messages |
| sizeButtons | Longint | ⬅️ | (Windows) Size of font for Stop buttons |
## Description

The **Progress SET FONT SIZES** method changes the font size used for the different text displayed in all the progress windows.

In the [sizeTitles](# "Size of font for titles"), [sizeMessages](# "Size of font for messages") and [sizeButtons](# "(Windows) Size of font for Stop buttons") parameters, pass the font sizes to use. If you do not want to modify a size, pass -1 in the corresponding parameter.

### Example 1  

We want to change the size only for messages:

```4d
 Progress SET FONT SIZES(-1;13)
```

### Example 2  

We want to change the size of titles and messages:

```4d
 Progress SET FONTS("Arial Black";"Arial narrow")  
 Progress SET FONT SIZES(13;12)
```

![](https://doc.4d.com/4Dv19/picture/925231/pict925231.en.png)

## See also

[Progress SET FONTS](Progress%20SET%20FONTS%20.md)
