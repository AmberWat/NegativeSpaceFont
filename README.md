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

| Character             | Width |
|-----------------------|-------|
| `\uF801`              | -1    |
| `\uF802`              | -2    |
| `\uF803`              | -3    |
| `\uF804`              | -4    |
| `\uF805`              | -5    |
| `\uF806`              | -6    |
| `\uF807`              | -7    |
| `\uF808`              | -8    |
| `\uF809`              | -16   |
| `\uF80A`              | -32   |
| `\uF80B`              | -64   |
| `\uF80C`              | -128  |
| `\uF80D`              | -256  |
| `\uF80E`              | -512  |
| `\uF80F`              | -1024 |
| `\uF800`              | -max  |


| Character             | Width |
|-----------------------|-------|
| `\uF821`              | 1     |
| `\uF822`              | 2     |
| `\uF823`              | 3     |
| `\uF824`              | 4     |
| `\uF825`              | 5     |
| `\uF826`              | 6     |
| `\uF827`              | 7     |
| `\uF828`              | 8     |
| `\uF829`              | 16    |
| `\uF82A`              | 32    |
| `\uF82B`              | 64    |
| `\uF82C`              | 128   |
| `\uF82D`              | 256   |
| `\uF82E`              | 512   |
| `\uF82F`              | 1024  |
| `\uF820`              | max   |

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