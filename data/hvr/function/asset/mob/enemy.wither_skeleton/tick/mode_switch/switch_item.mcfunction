#> hvr:asset/mob/enemy.wither_skeleton/tick/mode_switch/switch_item
#
# Switch handing items
#
# @within function
#   hvr:asset/mob/enemy.wither_skeleton/tick/mode_switch/melee
#   hvr:asset/mob/enemy.wither_skeleton/tick/mode_switch/range

# Add tag
    execute on passengers if entity @s[type=item_display,tag=hvr.asset.mob.wither_skeleton.item_holder] run tag @s add hvr.asset.mob.wither_skeleton.item_holder_this

# Get holder cache
    data modify storage hvr.__temp__:asset/mob holder_equipment set from entity @n[type=item_display,tag=hvr.asset.mob.wither_skeleton.item_holder_this] item

# Change holder item
    data modify entity @n[type=item_display,tag=hvr.asset.mob.wither_skeleton.item_holder_this] item set from entity @s equipment.mainhand

# Get item from cache
    data modify entity @s equipment.mainhand set from storage hvr.__temp__:asset/mob holder_equipment

# Reset
    data remove storage hvr.__temp__:asset/mob holder_equipment
    tag @n[type=item_display,tag=hvr.asset.mob.wither_skeleton.item_holder_this] remove hvr.asset.mob.wither_skeleton.item_holder_this