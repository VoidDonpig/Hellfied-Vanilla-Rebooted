#> hvr:asset/object/world.meteor/tick/
#
# Tick process
#
# @within function hvr:entity_manager/object/event/tick/dispatch/m

# tp
    scoreboard players set $remaining_loop hvr.temporary 10
    execute positioned ^ ^ ^0.6 run function hvr:asset/object/world.meteor/tick/move

# Add score
    scoreboard players add @s hvr.asset.generic 1

# Autokill
    tag @s[scores={hvr.asset.generic=1200..}] add hvr.vanish

# Reset
    scoreboard players reset $remaining_loop hvr.temporary
