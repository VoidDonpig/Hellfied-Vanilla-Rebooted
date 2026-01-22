#> hvr:lib/array/compare
#
# Compare results and return results
#
# @input
#   T extends any
#   storage hvr:lib array_a: [T] @ N
#   storage hvr:lib array_b: [T] @ N
#
# @output
#   storage
#       hvr:lib compare_result: [{ _: { _: boolean } }] @ N
#
# @api

# Check settion
    execute unless data storage hvr:lib {array_session_opened:true} run tellraw @a [{"storage":"global:","nbt":"Prefix.Caution"},{"text":"Lib array session is not opened","color":"white"}]

# Init
    data remove storage hvr:lib array

# Compare
    execute if data storage hvr:lib array_a[0] if data storage hvr:lib array_b[0] run function hvr:lib/array/core/compare

# Reverse results
    function hvr:lib/array/reverse

# Insert results
    data modify storage hvr:lib compare_result set from storage hvr:lib array

# Reset
    scoreboard players reset $is_different hvr.temporary
    data remove storage hvr:lib array
