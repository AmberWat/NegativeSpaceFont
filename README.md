# Negative Space Font
This resource pack for Minecraft Java Edition contains a font with a lot of negative and positive size spaces. Included are also translations for easy use and magic digit support for use with scores.

## Raw characters:
`\uF801` to `\uF808`: -1 to -8 pixels
`\uF809` to `\uF80F`: -16, -32, -64, -128, -256, -512 and -1024 pixels

`\uF821` to `\uF828`: 1 to 8 pixels
`\uF829` to `\uF82F`: 16, 32, 64, 128, 256, 512 and 1024 pixels

`\uF800` and `\uF820`: `-max` and `max`, maximally negative and positive

Adding `0x10` to a character code creates the *non splitting* version of that character, which causes text rendering to be processed in larger chunks. This improves performance but makes render order unpredictable when there is overlap. Luckily only a single *splitting* character is required to restore order.

## Translation keys:
These cover *all* sizes between -1024 and 1024 as well as `-max`, `max` and multiples of 1024 up to 8192.

Add positive or negative spaces anywhere:
```json
[{"text":"Start"},{"translate":"space.-11"},{"text":"End moved closer to the start by 11 pixels"}]
```

Offset content inside `with` but then return to the original position:
```json
{"translate":"offset.-14","with":[{"text":"I'm offset 14 pixels to the left"}]}
```

*(These methods can accomplish the same things. Use whichever you prefer.)*

## Magic digits:
These make it possible to generate dynamic widths using scores and are optimized for maximum range without requiring a lookup table.
They require 1.16's multi font support and setting `"font":"space:default"`.

| Char | Result     |
|:-----|:-----------|
| `9`  | 1 wide     |
| `8`  | 3 wide     |
| `7`  | 8 wide     |
| `6`  | 21 wide    |
| `5`  | 55 wide    |
| `4`  | 144 wide   |
| `3`  | 377 wide   |
| `2`  | 988 wide   |
| `1`  | 2584 wide  |
| `-`  | -6765 wide |
