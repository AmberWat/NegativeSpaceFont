# Negative Space Font
This resource pack for Minecraft Java Edition contains a font with a lot of negative and positive size spaces. Included are also translations for easy use and magic digit support for use with scores.

## What are negative spaces?
Instead of pushing things forward to the right, they pull things backward to the left. This allows for all kinds of tricks involving text and fonts. Especially since fonts can load textures, both big and small.

## How to use character codes
Codes of the form `\uXXXX` can be used directly, with the game automatically converting to the actual character when displayed. You can also perform the conversion yourself. [Unicode code converter](https://r12a.github.io/app-conversion/) is a simple web tool that can help (for Minecraft, look for JS/Java/C and uncheck ES6).

## Translation keys (Recommended)
These cover sizes between `-8192` and `8192` as well as `-max`/`max`. They are usually easier to use compared to dealing with raw character codes that are impossible to remember.

They are also more future proof since they can be changed on the pack's end in case there are issues or new developments.

Use `space.<width>` to add positive or negative spaces anywhere:
```json
[{"text":"Start"},{"translate":"space.-11"},{"text":"End moved back 11 pixels"}]
```

Use `offset.<width>` to shift only the content inside `with` and then return:
```json
["This is unaffected.",{"translate":"offset.-14","with":[{"text":"This part offset 14 pixels."}]},"This is also unaffected."]
```

## Basic characters (Intermediate)
These are available in a select number of sizes to strike a balance between ease of use and taking up valuable capacity.

| Regular (Recommended) | No-Split (Performance) | Width |
|-----------------------|------------------------|-------|
| `\uF801`              | `\uF811`               | -1    |
| `\uF802`              | `\uF812`               | -2    |
| `\uF803`              | `\uF813`               | -3    |
| `\uF804`              | `\uF814`               | -4    |
| `\uF805`              | `\uF815`               | -5    |
| `\uF806`              | `\uF816`               | -6    |
| `\uF807`              | `\uF817`               | -7    |
| `\uF808`              | `\uF818`               | -8    |
| `\uF809`              | `\uF819`               | -16   |
| `\uF80A`              | `\uF81A`               | -32   |
| `\uF80B`              | `\uF81B`               | -64   |
| `\uF80C`              | `\uF81C`               | -128  |
| `\uF80D`              | `\uF81D`               | -256  |
| `\uF80E`              | `\uF81E`               | -512  |
| `\uF80F`              | `\uF81F`               | -1024 |
| `\uF800`              | `\uF810`               | -max  |


| Regular (Recommended) | No-Split (Performance) | Width |
|-----------------------|------------------------|-------|
| `\uF821`              | `\uF831`               | 1     |
| `\uF822`              | `\uF832`               | 2     |
| `\uF823`              | `\uF833`               | 3     |
| `\uF824`              | `\uF834`               | 4     |
| `\uF825`              | `\uF835`               | 5     |
| `\uF826`              | `\uF836`               | 6     |
| `\uF827`              | `\uF837`               | 7     |
| `\uF828`              | `\uF838`               | 8     |
| `\uF829`              | `\uF839`               | 16    |
| `\uF82A`              | `\uF83A`               | 32    |
| `\uF82B`              | `\uF83B`               | 64    |
| `\uF82C`              | `\uF83C`               | 128   |
| `\uF82D`              | `\uF83D`               | 256   |
| `\uF82E`              | `\uF83E`               | 512   |
| `\uF82F`              | `\uF83F`               | 1024  |
| `\uF820`              | `\uF830`               | max   |

The **no-split** versions cause text rendering to be processed in larger chunks. This improves performance but makes render order unpredictable when there is overlap. However, they can be mixed and a single **regular** version character will fix the order.

## Magic digits (Intermediate)
These make it possible to generate dynamic widths without a lookup table by utilizing the easy manipulation of scoreboard values.
Because they override ordinary digits they require 1.16's multi font support and setting `"font":"space:default"`.

| Char | Width |
|:-----|:------|
| `9`  | 1     |
| `8`  | 3     |
| `7`  | 8     |
| `6`  | 21    |
| `5`  | 55    |
| `4`  | 144   |
| `3`  | 377   |
| `2`  | 987   |
| `1`  | 2584  |
| `-`  | -6765 |

If you're wondering, the widths come from taking every other Fibonacci number because of their property of adding up to the next term. It doesn't result in *the* best range, but other solutions seem to only add a few percent while being harder to calculate.

## Bugs and feedback
If you discover a bug, have a request or need help, please submit an issue on GitHub or contact AmberW#4615 on Discord.