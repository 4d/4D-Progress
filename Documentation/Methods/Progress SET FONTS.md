# Progress SET FONTS  

> Progress SET FONTS ( fontTitles {; fontMessages {; fontButtons}} )

| Parameter | Type |     | Description |
| --- | --- | --- | --- |
| fontTitles | Text | ⬅️ | Font to use for titles |
| fontMessages | Text | ⬅️ | Font to use for messages |
| fontButtons | Text | ⬅️ | (Windows) Font to use for Stop buttons |
## Description

The **Progress SET FONTS** method changes the fonts used for the different text displayed in all the progress windows.

In the `fontTitles`, `fontMessages` and `fontButtons` parameters, pass the names of the fonts to use. If you do not want to modify a font, pass an empty string ("") in the corresponding parameter.

### Example  

We want to change the font only for messages:

```4d
 Progress SET FONTS("";"Arial")
```

## See also

[Progress SET FONT SIZES](Progress%20SET%20FONT%20SIZES.md)
