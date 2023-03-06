Negative Space Font
===================

This resource pack for Minecraft Java Edition contains a font with a lot spaces, both positive and negative. It also includes translation keys for easy use and magic digit support for use with data packs.


What are negative spaces?
-------------------------

Instead of pushing things forwards to the right, they pull things backwards to the left. This allows for all kinds of tricks involving text and fonts - especially since fonts can load textures, both big and small.

For example, you can make things overlap by making the spacing between them negative. Or you can shift or realign things horizontally, even escaping the normal boundries of a text box.


Why can't I get this to work with X?
-----------------------------------------------------

Often developers of plugins/mods/tools will skip out on supporting translation text components. They'll also often not even support escape codes. In that case you have no choice but to resort to [raw characters](#character-codes-and-raw-characters-advanced).

You can check if the pack itself is working with a simple `tellraw` command:
```
/tellraw @a [{"text": "Start", "color": "blue"},{"translate": "space.-11"},{"text": "End", "color": "red"}]
```

If you're really stuck, feel free to [ask for help](#bugs-help-and-feedback).

License and use
---------------
This pack is availible under Creative Commons Attribution 4.0 International (see LICENSE.txt). This gives you a lot of freedom to spread and adapt it to suit your needs. For example, you could alter parts that don't suit your needs and/or merge it into a pack of your own and share it.

Just remember to include attribution. A link back to the repository is appreciated, but not required.

Check the Releases section on [Github](https://github.com/AmberWat/NegativeSpaceFont) for downloads, updates and release notes.


Translation keys (Recommended)
------------------------------

Translation keys are the easiest and most future-proof option for using this pack. When you insert a translation the language file handles the conversion into the special characters needed. This works no matter what language is active.

### `space.<width>`
Inserts just the space character, nothing else.

These are the recommended option.

**JSON example:**
```json
[
	{"text": "Start", "color": "blue"},
	{"translate": "space.-11"},
	{"text": "End (moved back 11 pixels)", "color": "red"}
]
```

### `offset.<width>`
Inserts the space character, then some content of your choosing, and then the opposite of the first space character. The effect is that the content is offset from its normal position without moving any of the stuff around it.

These are an advanced option for those who want it.

**JSON Example:**
```json
[
	"Unaffected part.",
	{
		"translate": "offset.-14",
		"with": [{"text":"This part offset 14 pixels."}]
	},
	"Also an unaffected part."
]
```

### `newlayer`
Inserts a special character that "splits up" the rendering of the current text. The effect is that everything after the split ends up on a new layer on top of everything that came before.

This are not mandatory but can help with rendering issues where content ends up behind something else. *They carry a slight performance penalty that can affect client FPS when used in large amounts.*

**JSON Example:**
```json
[
	{"text": "Start", "color": "blue"},
	{"translate": "space.-51"},
	{"translate": "newlayer"},
	{"text": "End (moved back 51 pixels and placed on a new layer)", "color": "red"}
]
```
Try removing the `{"translate": "newlayer"},` and comparing.

### What values can be used for `<width>`?
+ **Integers** from `-4096` to `4096` (`space.691` for example)

+ **Fractions** in the form `<numerator>/<denominator>` with a value between -1 and 1, with a denominator of `2`, `3`, `4`, `5`, `6`, `8`, `10`, `12`, `15`, `16`, `20`, `24`, `25`, `30`, `32`, `40`, `48`, `50`, `60`, `64`, `75`, `80`, `96` or `100` (`space.39/60` for example)

+ **Infinities** both positive `infinity` and negative `-infinity` (`space.infinity` for example)


Magic digits (For data packs)
-----------------------------

Magic digits are primarily for data pack creators. Because strings can be hard to manipulate or look up, these allow using much simpler scoreboard math to calculate some digits to display. The digits are then reskinned into space characters by changing the font.

Because they replace ordinary digits they require adding `"font":"space:default"` to set the font. Only Minecraft 1.16+ includes this multi-font support.

| Char | Width |
|:----:|------:|
| `9`  |     1 |
| `8`  |     3 |
| `7`  |     8 |
| `6`  |    21 |
| `5`  |    55 |
| `4`  |   144 |
| `3`  |   377 |
| `2`  |   987 |
| `1`  |  2584 |
| `-`  | -6765 |

**JSON Example:**
```json
[
	{"text": "Start", "color": "blue"},
	{"font": "space:default", "score": {"name": "spacer", "objective": "spacefont"}}
	{"text": "End (moved by a dynamic amount)", "color": "red"}
]
```

### Helper data pack
By loading this pack as a data pack rather than resource pack you can access sample functions for turning a width between -6764 and 6764 into a set of magic digits, ready for display. Big thanks to vdvman1 for helping with these.

See the function `spacefont:magic_digits` for more details.

### Why these widths?

The widths come from taking every other Fibonacci number because of their property of adding up to the next term. It doesn't result in the absolute best range, but other solutions seem to only add a few percent while being harder to calculate.


Character codes and raw characters (advanced)
---------------------------------------------

Characters can be inserted directly, either as escape codes or in raw form. These are best used by plugins and third party tools since they are easy to calculate but difficult to write by hand. Minecraft will convert escape codes of the form `\uXXXX` or `\uXXXX\uXXXX` into the actual character when displayed.

Please note that codes above `\uFFFF` must be represented as [surrogate pairs](https://en.wikipedia.org/wiki/UTF-16#Code_points_from_U+010000_to_U+10FFFF) (consisting of two characters in the range `\uD800`-`\uDBFF` and `\uDC00`-`\uDFFF` right after each other).

[Unicode code converter](https://r12a.github.io/app-conversion/) is a simple web tool that can help convert between different formats (for Minecraft, look for JS/Java/C and uncheck ES6).

The language file of the pack can sometimes be a helpful reference as it contains the characters used for all the translation keys.

### Integer width spaces
Simple integer widths from `-4096` to `4096`

**Example Formula:**
`0xD0000 + width` converted to a character (`-4096 <= width <= 4096`)

| Char  |    Code     | For Minecraft  |                       Width |
|:-----:|:-----------:|:--------------:|----------------------------:|
|  `󏀀`  | `\u{CF000}` | `\uDAFC\uDC00` |                       -4096 |
| *...* |    *...*    |     *...*      | *<small>steps of 1</small>* |
|  `󏿿`  | `\u{CFFFF}` | `\uDAFF\uDFFF` |                          -1 |
|  `󐀀`  | `\u{D0000}` | `\uDB00\uDC00` |                           0 |
|  `󐀁`  | `\u{D0001}` | `\uDB00\uDC01` |                           1 |
| *...* |    *...*    |     *...*      | *<small>steps of 1</small>* |
|  `󐿿`  | `\u{D0FFF}` | `\uDB03\uDFFF` |                        4096 |

### Fraction width spaces
Widths that can be expressed as `n/4800`, with `n` being an integer between `-4800` and `4800`.

**Example Formula:**
`0xD0000 + round(width * 4800)` converted to a character (`-1 <= width <= 1`)

| Char  |    Code     | For Minecraft  |                            Width |
|:-----:|:-----------:|:--------------:|---------------------------------:|
|  `񎵀`  | `\u{4ED40}` | `\uD8FB\uDD40` |                  (-1) -4800/4800 |
| *...* |    *...*    |     *...*      | *<small>steps of 1/4800</small>* |
|  `񏿿`  | `\u{4FFFF}` | `\uD8FF\uDFFF` |                          -1/4800 |
|  `񐀀`  | `\u{50000}` | `\uD900\uDC00` |                       (0) 0/4800 |
|  `񐀁`  | `\u{50001}` | `\uD900\uDC01` |                           1/4800 |
| *...* |    *...*    |     *...*      | *<small>steps of 1/4800</small>* |
|  `񑋀`  | `\u{512C0}` | `\uD904\uDEC0` |                   (1)  4800/4800 |

### Infinite width spaces

| Char |    Code     | For Minecraft  |     Width |
|:----:|:-----------:|:--------------:|----------:|
| `󀀁`  | `\u{C0001}` | `\uDAC0\uDC01` | -infinity |
| `󟿿`  | `\u{DFFFF}` | `\uDB3F\uDFFF` |  infinity |

### New layer

Works the same as the [newlayer](#newlayer) translation key.

| Char |    Code     | For Minecraft  |
|:----:|:-----------:|:--------------:|
| `󀀀`  | `\u{C0000}` | `\uDAC0\uDC00` |


Bugs, help and feedback
-----------------------

If you discover a bug, have a request or need help, please submit an issue on [GitHub](https://github.com/AmberWat/NegativeSpaceFont) or visit on [Discord](https://discord.gg/ezKsfeQAYH).