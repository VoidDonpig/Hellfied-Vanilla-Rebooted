#> hvr:asset/mob/enemy.evoker/init/
#
# Init process
#
# @within function hvr:entity_manager/mob/event/init/dispatch/m

# If captain, give buff
    execute if entity @s[predicate=hvr:is_captain] run function hvr:asset/mob/enemy.evoker/init/captain_buff