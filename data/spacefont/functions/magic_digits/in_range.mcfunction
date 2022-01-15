scoreboard players set spacer spacefont 0

execute store result score #is_neg spacefont if score width spacefont matches ..-1
execute if score width spacefont matches ..-1 run scoreboard players add width spacefont 6765

execute if score width spacefont matches 2584..6764 run function spacefont:magic_digits/1_10
execute if score width spacefont matches 987..2583 run function spacefont:magic_digits/2_9
execute if score width spacefont matches 377..986 run function spacefont:magic_digits/3_8
execute if score width spacefont matches 144..376 run function spacefont:magic_digits/4_7
execute if score width spacefont matches 55..143 run function spacefont:magic_digits/5_6
execute if score width spacefont matches 21..54 run function spacefont:magic_digits/6_5
execute if score width spacefont matches 8..20 run function spacefont:magic_digits/7_4
execute if score width spacefont matches 3..7 run function spacefont:magic_digits/8_3
execute if score width spacefont matches 1..2 run function spacefont:magic_digits/9_2

execute if score #is_neg spacefont matches 1.. run scoreboard players operation spacer spacefont *= #-1 spacefont