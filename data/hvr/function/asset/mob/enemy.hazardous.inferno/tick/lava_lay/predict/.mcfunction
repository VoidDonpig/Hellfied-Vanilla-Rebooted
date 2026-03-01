#> hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/predict/
#
# Lava Lay prediction
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/in_hostile

# Repeat til reach limit
    execute anchored eyes positioned ^ ^ ^ facing entity @n[tag=hvr.target] eyes run function hvr:asset/mob/enemy.hazardous.inferno/tick/lava_lay/predict/for
