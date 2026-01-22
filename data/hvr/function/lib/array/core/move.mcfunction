#> hvr:lib/array/core/move
#
# Move
#
# @within function hvr:lib/array/**

# Get cache
    data modify storage hvr:lib cache append from storage hvr:lib array[-1]
    data remove storage hvr:lib array[-1]

# Repeat
    scoreboard players remove $index hvr.temporary 1
    execute if score $index hvr.temporary matches 1.. run function hvr:lib/array/core/move
