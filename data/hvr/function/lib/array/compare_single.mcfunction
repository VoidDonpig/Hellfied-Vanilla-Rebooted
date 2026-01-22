#> hvr:lib/array/compare_single
#
# Compare arrays and return results
#
# @input storage hvr:lib
#   array: [T] @ N
#   compare_target: T
#
# @output storage hvr:lib compare_result: [{ _: { _: boolean } }] @ N
#
# @api

# Check settion
    execute unless data storage hvr:lib {array_session_opened:true} run tellraw @a [{"storage":"global:","nbt":"Prefix.Caution"},{"text":"Lib array session is not opened","color":"white"}]

# Migration
    data modify storage hvr:lib copied_array set from storage hvr:lib array
    data remove storage hvr:lib array

# Compare
    execute if data storage hvr:lib copied_array[0] run function hvr:lib/array/core/compare_single

# Reverse result
    function hvr:lib/array/reverse

# Insert result
    data modify storage hvr:lib compare_result set from storage hvr:lib array

# Reset
    scoreboard players reset $is_different hvr.temporary
    data remove storage hvr:lib array
    data remove storage hvr:lib compare_target
    data remove storage hvr:lib copied_array
