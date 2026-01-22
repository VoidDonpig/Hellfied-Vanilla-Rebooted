#> hvr:lib/array/mask_inverted
#
# Mask array
#
# @input
#   T extends any
#   storage hvr:lib array: [T] @ N
#   storage hvr:lib masks: [{ _: { _: boolean } }] @ N
#   storage hvr:lib mask_element? : any
#
# @output
#   storage
#       hvr:lib array: [T] @ ..N
#
# @api

# Check settion
    execute unless data storage hvr:lib {array_session_opened:true} run tellraw @a [{"storage":"global:","nbt":"Prefix.Caution"},{"text":"Lib array session is not opened","color":"white"}]

# Migration
    data modify storage hvr:lib copied_array set from storage hvr:lib array
    data modify storage hvr:lib array set value []

# Start masking
    execute if data storage hvr:lib masks[0] if data storage hvr:lib copied_array[0] run function hvr:lib/array/core/mask_inverted

# Reverse results
    function hvr:lib/array/reverse

# Reset
    data remove storage hvr:lib copied_array
    data remove storage hvr:lib mask
    data remove storage hvr:lib masks
    data remove storage hvr:lib mask_element
