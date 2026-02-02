#> hvr:asset/mob/enemy.warden/sonic_boom/double_check_process
#
# Double check process
#
# @within function hvr:asset/mob/enemy.warden/tick/in_hostile

# Add passed tag
    tag @s add hvr.asset.mob.warden.sonic_boom_check_passed

# Check
    function hvr:asset/mob/enemy.warden/sonic_boom/check_target_is_in_radius/check
    execute unless data storage hvr.__temp__:asset/mob {sonic_boom_ready:true} run tag @s remove hvr.asset.mob.warden.sonic_boom_check_passed
    execute if data entity @n[type=#hvr:living,tag=hvr.target] {Invulnerable:1b} run tag @s remove hvr.asset.mob.warden.sonic_boom_check_passed

# Proc
    execute if entity @s[tag=hvr.asset.mob.warden.sonic_boom_check_passed] run function hvr:asset/mob/enemy.warden/sonic_boom/

# Reset
    tag @s remove hvr.asset.mob.warden.sonic_boom_check_passed
    data remove storage hvr.__temp__:asset/mob __temp__
    data remove storage hvr.__temp__:asset/mob sonic_boom_ready