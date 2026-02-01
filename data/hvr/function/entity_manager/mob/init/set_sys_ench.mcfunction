#> hvr:core/tick/mob/set_sys_ench
#
# Set system enchantment
#
# @within function hvr:entity_manager/mob/init/common

# Set eq item
    execute if entity @s[type=!#hvr:have_natural_body_slot] unless items entity @s armor.body * run data modify entity @s equipment.body set value {id:stone_button}
    execute if entity @s[type=#hvr:have_natural_body_slot] unless items entity @s armor.feet * run data modify entity @s equipment.feet set value {id:stone_button}

# Provide ench
    data modify storage hvr.__temp__:core sys_ench set value {"hvr:entity_manager/mob/sys":1}
    execute if entity @s[type=!#hvr:have_natural_body_slot] run data modify entity @s equipment.body.components."minecraft:enchantments" merge from storage hvr.__temp__:core sys_ench 
    execute if entity @s[type=#hvr:have_natural_body_slot] run data modify entity @s equipment.feetcomponents."minecraft:enchantments" merge from storage hvr.__temp__:core sys_ench 

# Override drop chance
    execute if entity @s[type=!#hvr:have_natural_body_slot] run data modify entity @s drop_chances.body set value 0f
    execute if entity @s[type=#hvr:have_natural_body_slot] run data modify entity @s drop_chances.feet set value 0f

# Reset
    data remove storage hvr.__temp__:core sys_ench