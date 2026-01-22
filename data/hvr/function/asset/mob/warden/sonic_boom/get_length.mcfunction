#> hvr:asset/mob/warden/sonic_boom/get_length
#
# Get sonic boom length
#
# @within function hvr:asset/mob/warden/sonic_boom/proc

# Get distance from target
    execute at @n[type=#hvr:living,tag=hvr.target] run function hvr:lib/distance/as_to_at
    execute store result score $sonic_boom_length hvr.temporary run data get storage hvr:lib __output__.distance

# Calc distance
    scoreboard players add $sonic_boom_length hvr.temporary 7