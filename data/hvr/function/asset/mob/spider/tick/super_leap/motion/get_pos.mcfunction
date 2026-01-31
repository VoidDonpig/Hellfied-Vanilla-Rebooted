#> hvr:asset/mob/spider/tick/super_leap/motion/get_pos
#
# Get arrow pos
#
# @within function hvr:asset/mob/spider/tick/super_leap/motion/

# Get pos
    data modify storage hvr.__temp__:asset/mob __temp__.pos set from entity @s Pos
    data modify storage hvr.__temp__:asset/mob __temp__.x set from storage hvr.__temp__:asset/mob __temp__.pos[0]
    data modify storage hvr.__temp__:asset/mob __temp__.y set from storage hvr.__temp__:asset/mob __temp__.pos[1]
    data modify storage hvr.__temp__:asset/mob __temp__.z set from storage hvr.__temp__:asset/mob __temp__.pos[2]

# Remove marker
    kill @s
