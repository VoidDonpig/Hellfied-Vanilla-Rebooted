#> hvr:lib/distance/as_to_at
#
# Get distance from executed pos to executor pos
#
# @input
#   as entity position
#   at position
#
# @output storage hvr:lib __output__.distance
#
# @api

# Get executor pos
    execute positioned as @s summon marker run function hvr:lib/distance/core/get_pos

# Get distance
    execute rotated 180 90 summon marker run function hvr:lib/distance/core/get_delta.m with storage hvr.__temp__:lib __temp__

# Reset
    data remove storage hvr.__temp__:lib __temp__
