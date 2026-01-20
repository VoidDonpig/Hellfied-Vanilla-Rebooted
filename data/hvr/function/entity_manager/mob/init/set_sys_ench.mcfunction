#> hvr:core/tick/mob/set_sys_ench
#
# Set system enchantment
#
# @within function hvr:entity_manager/mob/init/common

# Set eq item
    execute if entity @s[type=!#hvr:have_natural_body_slot] unless items entity @s armor.body * run item replace entity @s armor.body with purple_carpet
    execute if entity @s[type=#hvr:have_natural_body_slot] unless items entity @s armor.feet * run item replace entity @s armor.feet with purple_carpet

# Provide ench
    execute if entity @s[type=!#hvr:have_natural_body_slot] run item modify entity @s armor.body hvr:entity_manager/mob/provide_sys_ench
    execute if entity @s[type=#hvr:have_natural_body_slot] run item modify entity @s armor.feet hvr:entity_manager/mob/provide_sys_ench

# Override drop chance
    execute if entity @s[type=!#hvr:have_natural_body_slot] run data modify entity @s drop_chances.body set value 0f
    execute if entity @s[type=#hvr:have_natural_body_slot] run data modify entity @s drop_chances.feet set value 0f