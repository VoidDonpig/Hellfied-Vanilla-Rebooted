#> hvr:lib/horizonal_distance/core/get_delta.m
#
# Get difference
#
# @within function hvr:lib/horizonal_distance/**

# Tp to difference
    $tp @s ^$(x) ^$(z) ^

# Get marker pos
    data modify storage hvr.__temp__:lib __temp__.pos set from entity @s Pos
    data modify storage hvr.__temp__:lib __temp__.x set from storage hvr.__temp__:lib __temp__.pos[0]
    data modify storage hvr.__temp__:lib __temp__.z set from storage hvr.__temp__:lib __temp__.pos[2]

# Change minus sign
    execute positioned as @s unless predicate hvr:lib/pos/is_x_positive run function hvr:lib/horizonal_distance/core/abs/x.m with storage hvr.__temp__:lib __temp__
    execute positioned as @s unless predicate hvr:lib/pos/is_z_positive run function hvr:lib/horizonal_distance/core/abs/z.m with storage hvr.__temp__:lib __temp__

# Geometry
    execute positioned 0.0 0.0 0.0 rotated 0 0 run function hvr:lib/horizonal_distance/core/geometry.m with storage hvr.__temp__:lib __temp__

# Remove marker
    kill @s
