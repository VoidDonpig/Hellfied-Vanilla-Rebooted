#> hvr:asset/mob/enemy.vindicator/init/enchantment_provider/random
#
# Random enchantment provider
#
# @within function hvr:asset/mob/enemy.vindicator/init/enchantment_provider/

# Value
    execute store result score $ hvr.temporary run random value 0..65535
    scoreboard players set $_ hvr.temporary 2
    scoreboard players operation $ hvr.temporary %= $_ hvr.temporary

# Select enchantment depending on rand
    execute if score $ hvr.temporary matches 0 run data modify storage hvr.__temp__:asset/mob about_merge_enchantments merge value {"sharpness":3}
    execute if score $ hvr.temporary matches 1 run data modify storage hvr.__temp__:asset/mob about_merge_enchantments merge value {"fire_aspect":2}
    execute if score $ hvr.temporary matches 2 run data modify storage hvr.__temp__:asset/mob about_merge_enchantments merge value {"knockback":1}

# Override mainhand drop chance
    data modify entity @s drop_chances.mainhand set value 0f

# Reset
    scoreboard players reset $ hvr.temporary
    scoreboard players reset $_ hvr.temporary