#> hvr:lib/horizonal_distance/core/get_pos
#
# Get pos
#
# @within function hvr:lib/horizonal_distance/**

# Get pos
    data modify storage hvr.__temp__:lib __temp__.pos set from entity @s Pos
    data modify storage hvr.__temp__:lib __temp__.x set from storage hvr.__temp__:lib __temp__.pos[0]
    data modify storage hvr.__temp__:lib __temp__.z set from storage hvr.__temp__:lib __temp__.pos[2]

# Remove marker
    kill @s
