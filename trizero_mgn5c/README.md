This is a Tri-Zero mod to use MGN5C front Z rails instead of MGN7H, to avoid panel clearance issue.

It also includes a GT2 16T version of the idler as an option for straightened belt line.
Two M3x5x0.5 shims are required to sandwich the 16T idler to avoid binding. The F623 version doesn't need shims.

The F623 version has the same hole location as the original Tri-Zero idler.
It is difficult to relocate due to interference with tension adjustment screw.
The belt line is off by 0.91mm but shouldn't introduce observable error in normal use.

![Install Photo](tri-zero%20mgn5c.jpg)

## Print Settings

Standard Voron settings. The default orientation is for the front left side. You need to mirror in the slicer to make the front right side.
Replaces `Z_Belt_Attachment_x2.stl` and `Z_Joint_x3.stl`. Reuses `Front_Bed_Attachment(_Mirrored)_x1.stl` from Tri-Zero.

## BOM (per side. double for both sides)

- MGN5C 150mm linear rail x 1
- M2x6 WHS x 10 (For rail mounting. [AliExpress](https://www.aliexpress.com/item/2251832676144796.html))
- M2 nut bar x 1 (May reuse the same one for MGN7H. Or use [my improved printed nutbar](../mgn7_nutbar).)
- M2x6 SHCS x 2
- M3x10 BHCS x 2
- M3x20 BHCS x 1
- M3x5x4 heat set insert x 2
