#> hvr:asset/mob/wither_skeleton/tick/mode_switch/range
#
# Range mode switch
#
# @within function hvr:asset/mob/wither_skeleton/tick/in_hostile

# Switch item
    function hvr:asset/mob/wither_skeleton/tick/mode_switch/switch_item

# Change tag
    tag @s remove hvr.asset.mob.wither_skeleton.melee_mode
    tag @s add hvr.asset.mob.wither_skeleton.range_mode