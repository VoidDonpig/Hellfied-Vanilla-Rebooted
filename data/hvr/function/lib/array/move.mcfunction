#> hvr:lib/array/move
#
# Move factors with index
#
# @input
#   T extends any
#   storage hvr:lib array: [T] @N
#   score $input.index hvr.lib
#
# @output storage hvr:lib
#   array: [T] @ (N - Index)
#   cache: [T] @ Index

# Check settion
    execute unless data storage hvr:lib {array_session_opened:true} run tellraw @a [{"storage":"global:","nbt":"Prefix.Caution"},{"text":"Lib array session is not opened","color":"white"}]

# Calc
    execute store result score $index hvr.temporary if data storage hvr:lib array[]
    scoreboard players remove $index hvr.temporary 1
    scoreboard players operation $index hvr.temporary -= $input.index hvr.lib

# Move
    execute if score $index hvr.temporary matches 1.. run function hvr:lib/array/core/move

# Reset
    scoreboard players reset $index hvr.temporary
