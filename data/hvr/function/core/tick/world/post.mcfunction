#> hvr:core/tick/world/post
#
# World post tick
#
# @within function hvr:core/tick/main

# Add item ticked tag
    tag @e[type=item,tag=!hvr.item_ticked] add hvr.item_ticked

# Autokill
    execute as @e[tag=hvr.autokill] run function hvr:world_manager/autokill/

# Immediately kill item have sys ench
    execute as @e[type=item,tag=!hvr.item_ticked] if items entity @s container.0 *[enchantments~[{enchantments:["hvr:entity_manager/mob/sys"]}]] run kill @s

# Vanish
    execute as @e[tag=hvr.vanish] at @s run function hvr:lib/vanish/