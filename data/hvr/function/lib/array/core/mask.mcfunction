#> hvr:lib/array/core/mask
#
# Mask
#
# @within function
#   hvr:lib/array/mask
#   hvr:lib/array/core/mask

# Get mask data
    data modify storage hvr:lib mask set from storage hvr:lib masks[-1]._._

# Mask or keep
    execute if data storage hvr:lib {mask:true} run data modify storage hvr:lib array append from storage hvr:lib mask_element
    execute if data storage hvr:lib {mask:false} run data modify storage hvr:lib array append from storage hvr:lib copied_array[-1]

# Remove foot
    data remove storage hvr:lib masks[-1]
    data remove storage hvr:lib copied_array[-1]

# Check
    execute if data storage hvr:lib masks[0] unless data storage hvr:lib copied_array[0] run tellraw @a [{"storage":"global:","nbt":"prefix.error"},{"text":"The number of factors of arrays is different.","color":"white"}]
    execute unless data storage hvr:lib masks[0] if data storage hvr:lib copied_array[0] run tellraw @a [{"storage":"global:","nbt":"prefix.error"},{"text":"The number of factors of arrays is different.","color":"white"}]

# Repeat
    execute if data storage hvr:lib masks[0] if data storage hvr:lib copied_array[0] run function hvr:lib/array/core/mask
