#> hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/
#
# Lava Lay
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/in_hostile

# Repeat til reach limit
    execute anchored eyes positioned ^ ^ ^ facing entity @n[tag=hvr.target] eyes run function hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/for

# When hit
    execute as @n[tag=hvr.asset.mob.enemy.hazardous.inferno.lava_lay_hit] run function hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/when_hit