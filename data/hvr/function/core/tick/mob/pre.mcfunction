#> hvr:core/tick/mob/pre
#
# Mob post tick
#
# @within function hvr:core/tick/main

# When convert, init again as natural mob
    execute if entity @s[type=#hvr:may_be_converted,tag=hvr.mob_already_init] unless score @s hvr.mob_id matches 1.. run function hvr:entity_manager/mob/init/converted_mob

# If mob lose system equipment, restore status
    execute if entity @s[type=!#hvr:have_natural_body_slot,tag=hvr.mob_already_init] unless items entity @s armor.body *[enchantments~[{enchantments:["hvr:entity_manager/mob/sys"]}]] run function hvr:entity_manager/mob/restore_status
    execute if entity @s[type=#hvr:have_natural_body_slot,tag=hvr.mob_already_init] unless items entity @s armor.feet *[enchantments~[{enchantments:["hvr:entity_manager/mob/sys"]}]] run function hvr:entity_manager/mob/restore_status