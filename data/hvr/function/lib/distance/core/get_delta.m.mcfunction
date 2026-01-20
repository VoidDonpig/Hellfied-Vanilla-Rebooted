#> hvr:lib/distance/core/get_delta.m
#
# Get distance
#
# @within function hvr:lib/distance/**

# Tp to difference pos
    $tp @s ^$(x) ^$(z) ^$(y)

# Get pos
    data modify storage hvr.__temp__:lib __temp__.pos set from entity @s Pos
    data modify storage hvr.__temp__:lib __temp__.x set from storage hvr.__temp__:lib __temp__.pos[0]
    data modify storage hvr.__temp__:lib __temp__.y set from storage hvr.__temp__:lib __temp__.pos[1]
    data modify storage hvr.__temp__:lib __temp__.z set from storage hvr.__temp__:lib __temp__.pos[2]

# Change minus sign
    execute positioned as @s unless predicate hvr:lib/pos/is_x_positive run function hvr:lib/distance/core/abs/x.m with storage hvr.__temp__:lib __temp__
    execute positioned as @s unless predicate hvr:lib/pos/is_y_positive run function hvr:lib/distance/core/abs/y.m with storage hvr.__temp__:lib __temp__
    execute positioned as @s unless predicate hvr:lib/pos/is_z_positive run function hvr:lib/distance/core/abs/z.m with storage hvr.__temp__:lib __temp__

# Geometry
    execute positioned 0.0 0.0 0.0 rotated 0 0 run function hvr:lib/distance/core/geometry.m with storage hvr.__temp__:lib __temp__

# Remove marker
    kill @s
