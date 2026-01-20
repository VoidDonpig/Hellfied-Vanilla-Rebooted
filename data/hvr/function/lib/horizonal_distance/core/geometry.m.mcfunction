#> hvr:lib/horizonal_distance/core/geometry.m
#
#
#
# @within function hvr:lib/horizonal_distance/**

# Geometry execution
    $execute facing ^ ^ ^$(z) facing ^$(x) ^ ^$(z) facing ^ ^ ^$(z) run tp @s ^-$(x) ^ ^$(z)

# Get distance
    data modify storage hvr:lib __output__.horizonal_distance set from entity @s Pos[2]
