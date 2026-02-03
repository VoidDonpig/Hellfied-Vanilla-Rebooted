#> hvr:asset/object/world.meteor.fake_flash/tick/
#
# Tick process
#
# @within function hvr:entity_manager/object/event/tick/dispatch/m

# SFX
    particle flash{color:[1f,1f,1f,1f]} ~ ~ ~ 0.0 0.0 0.0 0 1 force
    particle flame ~ ~ ~ 0.3 0.3 0.3 0.08 16

# TP
    tp @s ^ ^ ^4

# Count existing time
    scoreboard players add @s hvr.asset.generic 1

# Autokill
    tag @s[scores={hvr.asset.generic=60..}] add hvr.vanish