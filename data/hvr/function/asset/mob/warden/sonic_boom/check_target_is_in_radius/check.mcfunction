#> hvr:asset/mob/warden/sonic_boom/check_target_is_in_radius/check
#
# Check if the target is in radius
#
# @within function hvr:asset/mob/warden/sonic_boom/double_check_process

# Get anchor posision
    data modify storage hvr.__temp__:asset/mob __temp__.pos set from entity @s Pos
    data modify storage hvr.__temp__:asset/mob __temp__.warden_pos.x set from storage hvr.__temp__:asset/mob __temp__.pos[0]
    data modify storage hvr.__temp__:asset/mob __temp__.warden_pos.y set from storage hvr.__temp__:asset/mob __temp__.pos[1]
    data modify storage hvr.__temp__:asset/mob __temp__.warden_pos.z set from storage hvr.__temp__:asset/mob __temp__.pos[2]

# Check if target is in sonic boom radius
    function hvr:asset/mob/warden/sonic_boom/check_target_is_in_radius/detect.m with storage hvr.__temp__:asset/mob __temp__.warden_pos

# Reset
    data remove storage hvr.__temp__:asset/mob __temp__