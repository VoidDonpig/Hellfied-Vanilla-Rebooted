#> hvr:lib/array/core/math/max
#
# Get max value
#
# @within function
#   hvr:lib/array/math/max
#   hvr:lib/array/core/math/max

# Compare
    execute if score $is_numeric hvr.temporary matches 0 store result score $value hvr.temporary run data get storage hvr:lib array[-1]
    execute if score $is_numeric hvr.temporary matches 1 store result score $value hvr.temporary run data get storage hvr:lib array[-1] 100
    scoreboard players operation $max hvr.temporary > $value hvr.temporary

# Remove foot
    data remove storage hvr:lib array[-1]

# Repeat until all factors are done
    execute if data storage hvr:lib array[0] run function hvr:lib/array/core/math/max
