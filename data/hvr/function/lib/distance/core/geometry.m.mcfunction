#> hvr:lib/distance/core/geometry.m
#
#
#
# @within function hvr:lib/distance/**

# Geometry execution
    $execute facing ^ ^$(y) ^$(z) facing ^$(x) ^-$(y) ^$(z) facing ^ ^$(y) ^$(z) run tp @s ^-$(x) ^-$(y) ^$(z)

# Get distance
    data modify storage hvr:lib __output__.distance set from entity @s Pos[2]
