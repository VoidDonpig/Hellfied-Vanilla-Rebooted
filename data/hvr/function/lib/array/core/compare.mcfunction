#> hvr:lib/array/core/compare
#
# Compare
#
# @within function
#   hvr:lib/array/compare
#   hvr:lib/array/core/compare

#> Private
# @private
#declare score_holder $is_different

# Compare
    data modify storage hvr:lib array append value {_:{_:true}}
    execute store success score $is_different hvr.temporary run data modify storage hvr:lib array_a[-1] set from storage hvr:lib array_b[-1]
    execute store success storage hvr:lib array[-1]._._ byte 1 if score $is_different hvr.temporary matches 0

# Remove foot
    data remove storage hvr:lib array_a[-1]
    data remove storage hvr:lib array_b[-1]

# Check
    execute if data storage hvr:lib array_a[0] unless data storage hvr:lib array_b[0] run tellraw @a [{"storage":"hvr:global","nbt":"prefix.error"},{"text":"The number of factors of arrays is different.","color":"white"}]
    execute unless data storage hvr:lib array_a[0] if data storage hvr:lib array_b[0] run tellraw @a [{"storage":"hvr:global","nbt":"prefix.error"},{"text":"The number of factors of arrays is different.","color":"white"}]

# Repeat
    execute if data storage hvr:lib array_a[0] if data storage hvr:lib array_b[0] run function hvr:lib/array/core/compare
