#> hvr:asset/mob/enemy.pillager/init/enchantment_provider/
#
# Enchantment provider
#
# @within function hvr:asset/mob/enemy.pillager/init/

# Basic enchantment
    data modify storage hvr.__temp__:asset/mob about_merge_enchantments set value {"hvr:asset/mob/enemy.pillager/basic_weapon_enchantment":1}

# Merge enchantments
    data modify entity @s equipment.mainhand.components."minecraft:enchantments" merge from storage hvr.__temp__:asset/mob about_merge_enchantments

# Reset
    data remove storage hvr.__temp__:asset/mob about_merge_enchantments