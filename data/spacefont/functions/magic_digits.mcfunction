# -----------------------
# Magic Digits Calculator
# -----------------------
# 
# This function will convert a width in the range -6764 .. 6764 to a set of digits.
# When displayed in the extended negative space font, these digits will form a space with the input width.
#
# Input score: width spacefont
# Output score: spacer spacefont
# 
# Example usage:
# /scoreboard players set width spacefont -42
# /function spacefont:magic_digits
# /tellraw @a ["Hello ", {"font": "space:default", "score": {"name": "spacer","objective": "spacefont"}}, " There"]
#
# Example result: "Hello -1123466899 There" but with the score turning into a space of width -42.
#
# Digit sizes (just for reference):
# 9 = 1
# 8 = 3
# 7 = 8
# 6 = 21
# 5 = 55
# 4 = 144
# 3 = 377
# 2 = 987
# 1 = 2584
# - = -6765
#
# What is this sequence? It is every other Fibonacci number.
# If F(n) is the nth term, all terms before it add up to F(n+1).
# With 9 digits and 10 places to put them we can duplicate one digit.
# This extra capacity means we can skip every other term.
# Does it produce the largest range? No, but it eases scoreboard calculations.

execute if score width spacefont matches 6765.. run scoreboard players set spacer spacefont 1123456789
execute if score width spacefont matches ..-6765 run scoreboard players set spacer spacefont -9
execute if score width spacefont matches -6764..6764 run function spacefont:magic_digits/in_range