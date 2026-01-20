#> hvr:asset/mob/warden/sonic_boom/double_check_process
#
# Double check process
#
# @within function hvr:asset/mob/warden/in_hostile

# Add passed tag
    tag @s add hvr.mob_asset.warden.sonic_boom_check_passed

# Check
    function hvr:asset/mob/warden/sonic_boom/check_target_is_in_radius/check
    execute unless data storage hvr.__temp__:asset/mob __temp__{sonic_boom_ready:true} run tag @s remove hvr.mob_asset.warden.sonic_boom_check_passed
    execute if data entity @n[tag=hvr.target] {Invulnerable:1b} run tag @s remove hvr.mob_asset.warden.sonic_boom_check_passed

# Proc
    execute if entity @s[tag=hvr.mob_asset.warden.sonic_boom_check_passed] run function hvr:asset/mob/warden/sonic_boom/proc

# Reset
    tag @s remove hvr.mob_asset.warden.sonic_boom_check_passed
    data remove storage hvr.__temp__:asset/mob __temp__