#> hvr:asset/mob/enemy.cave_spider/attack/give_strong_poison
#
# Give strong poison effect to mob run this
#
# @within function hvr:asset/mob/enemy.cave_spider/attack/

# Give effect
    effect give @s poison 30 1
    
# SFX
    execute anchored eyes positioned ^ ^ ^ run particle dust{color:[0.094,0.678,0.192],scale:1} ~ ~ ~ 0.4 0.4 0.4 0 16
    execute anchored eyes positioned ^ ^ ^ run playsound entity.witch.drink hostile @a[distance=..16] ~ ~ ~ 1 0.7