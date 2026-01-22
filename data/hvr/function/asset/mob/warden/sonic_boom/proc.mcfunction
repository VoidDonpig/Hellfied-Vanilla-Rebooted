#> hvr:asset/mob/warden/sonic_boom/proc
#
# Procedure process when succeeded to exec sonic boom
#
# @within function hvr:asset/mob/warden/sonic_boom/double_check_process

# Get sonic boom length
    function hvr:asset/mob/warden/sonic_boom/get_length

# Repeat process until reach
    execute unless score $sonic_boom_length hvr.temporary matches ..0 positioned ~ ~1.6 ~ facing entity @n[type=#hvr:living,tag=hvr.target] eyes run function hvr:asset/mob/warden/sonic_boom/for_until_reach

# Reset
    scoreboard players reset $sonic_boom_length hvr.temporary