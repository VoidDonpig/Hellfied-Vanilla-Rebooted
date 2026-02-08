#> hvr:asset/mob/enemy.slime/death/
#
# Death process
#
# @within function hvr:entity_manager/mob/event/death/dispatch/m

# If the size is 0, summon oozing AEC
    execute if entity @s[nbt={Size:0}] run summon area_effect_cloud ~ ~ ~ {WaitTime:10s,potion_contents:{custom_effects:[{id:"oozing",amplifier:0,duration:200}]},Duration:200}