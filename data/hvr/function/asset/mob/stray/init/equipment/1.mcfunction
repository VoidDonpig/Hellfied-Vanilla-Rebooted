#> hvr:asset/mob/stray/init/equipment/1
#
# Place equipment
#
# @within function hvr:asset/mob/stray/init/

# Give helmet
    execute if data storage hvr:asset/mob equipment_exist{head:false} run item replace entity @s armor.head with leather_helmet[dyed_color=3752516]