#> hvr:asset/mob/wither_skeleton/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# Declare as range mode
    tag @s add hvr.asset.mob.wither_skeleton.range_mode

# Summon item display
    summon item_display ~ ~ ~ {Tags:[hvr.asset.mob.wither_skeleton.item_holder,hvr.asset.mob.wither_skeleton.item_holder_need_init,hvr.autokill,hvr.no_vehicle_kill],item:{id:"minecraft:stone_sword"},transformation:{right_rotation:[0f,0f,0f,1f],scale:[1f,1f,1f],left_rotation:[0.70710677f,0f,0.70710677f,0f],translation:[0.325f,-1.4f,0.0f]},teleport_duration:1}

# Make display ride
    ride @n[type=item_display,tag=hvr.asset.mob.wither_skeleton.item_holder,tag=hvr.asset.mob.wither_skeleton.item_holder_need_init,distance=..0.01] mount @s

# If lefthanded
    execute if data storage hvr:asset/mob {left_handed:true} on passengers if entity @s[type=item_display,tag=hvr.asset.mob.wither_skeleton.item_holder,tag=hvr.asset.mob.wither_skeleton.item_holder_need_init] run data modify entity @s transformation.translation[0] set value -0.325f

# Remove init tag
    execute on passengers if entity @s[type=item_display,tag=hvr.asset.mob.wither_skeleton.item_holder,tag=hvr.asset.mob.wither_skeleton.item_holder_need_init] run tag @s remove hvr.asset.mob.wither_skeleton.item_holder_need_init