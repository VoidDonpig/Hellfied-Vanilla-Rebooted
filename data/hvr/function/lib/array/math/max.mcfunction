#> hvr:lib/array/math/max
#
# Return max value in array
#
# @input
#   T extends any
#   storage hvr:lib array: [T]
#
# @output storage hvr:lib
#   max_result: T extends Numeric ? double : int
#
# @api

# Check settion
    execute unless data storage hvr:lib {array_session_opened:true} run tellraw @a [{"storage":"hvr:global","nbt":"prefix.caution"},{"text":"Lib array session is not opened","color":"white"}]

# Init
    scoreboard players set $max hvr.temporary -2147483648

# Whether factors is Numeric
    execute store success score $is_numeric hvr.temporary run data get storage hvr:lib array[-1] 1

# Calc
    function hvr:lib/array/core/math/max

# Insert result into max_result
    execute if score $is_numeric hvr.temporary matches 0 store result storage hvr:lib max_result int 1.00 run scoreboard players get $max hvr.temporary
    execute if score $is_numeric hvr.temporary matches 1 store result storage hvr:lib max_result double 0.01 run scoreboard players get $max hvr.temporary

# Reset
    scoreboard players reset $is_numeric hvr.temporary
    scoreboard players reset $max hvr.temporary
    scoreboard players reset $value hvr.temporary
