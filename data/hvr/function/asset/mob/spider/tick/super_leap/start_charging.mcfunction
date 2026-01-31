#> hvr:asset/mob/spider/tick/super_leap/start_charging
#
# When start leap charging
#
# @within function hvr:asset/mob/spider/tick/super_leap/

# SFX
    playsound block.grass.break hostile @a[distance=..16] ~ ~ ~ 1 0.7
    execute anchored eyes positioned ^ ^ ^ run playsound entity.spider.ambient hostile @a[distance=..16] ~ ~ ~ 1 0.7
    particle block{block_state:"dirt"} ~ ~ ~ 0.4 0.1 0.4 0 16

# Give slowness effect (not attribute because it is also as stun)
    effect give @s slowness 3 9 true