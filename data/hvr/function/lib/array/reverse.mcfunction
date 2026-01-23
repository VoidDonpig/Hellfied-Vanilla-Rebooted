#> hvr:lib/array/reverse
#
# Reverse array
#
# @input
#   T extends any
#   storage hvr:lib array: [T] @ N
#
# @output
#   T extends any
#   storage hvr:lib array: [T] @ N
#
# @api

# Check settion
    execute unless data storage hvr:lib {array_session_opened:true} run tellraw @a [{"storage":"hvr:global","nbt":"prefix.caution"},{"text":"Lib array session is not opened","color":"white"}]

# Reverse array
    function hvr:lib/array/core/reverse
