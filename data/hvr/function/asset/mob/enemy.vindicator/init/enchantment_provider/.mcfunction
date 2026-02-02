#> hvr:asset/mob/enemy.vindicator/init/enchantment_provider/
#
# Randam enchantment provider
#
# @within function hvr:asset/mob/enemy.vindicator/init/

# Basic enchantment
    data modify storage hvr.__temp__:asset/mob about_merge_enchantments set value {"hvr:asset/mob/enemy.vindicator/basic_weapon_enchantment":1}

# Random enchantments
    execute if items entity @s weapon.mainhand *[enchantments={}] run function hvr:asset/mob/enemy.vindicator/init/enchantment_provider/random

# Merge enchantments
    data modify entity @s equipment.mainhand.components."minecraft:enchantments" merge from storage hvr.__temp__:asset/mob about_merge_enchantments

# Reset
    data remove storage hvr.__temp__:asset/mob about_merge_enchantments