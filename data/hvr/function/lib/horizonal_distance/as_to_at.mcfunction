#> hvr:lib/horizonal_distance/as_to_at
#
# Get horizonal distance from executed pos to executor pos
#
# @input
#   as entity position
#   at position
# @output storage hvr:lib __output__.horizonal_distance
# @api

# Get executor Pos
    execute positioned as @s summon marker run function hvr:lib/horizonal_distance/core/get_pos

# Get Pos difference
    execute rotated 180 90 summon marker run function hvr:lib/horizonal_distance/core/get_delta.m with storage hvr.__temp__:lib __temp__

# Reset
    data remove storage hvr.__temp__:lib __temp__
