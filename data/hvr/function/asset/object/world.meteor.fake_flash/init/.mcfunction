#> hvr:asset/object/world.meteor.fake_flash/init/
#
# Init process
#
# @within function hvr:entity_manager/object/event/init/dispatch/m

# Set rotation
    execute store result score $ hvr.temporary run random value 0..65535
    scoreboard players set $_ hvr.temporary 1799
    scoreboard players operation $ hvr.temporary %= $_ hvr.temporary
    execute store result entity @s Rotation[0] double 0.1 run scoreboard players get $ hvr.temporary

# Reset
    scoreboard players reset $ hvr.temporary
    scoreboard players reset $_ hvr.temporary

# Initial sound
    playsound item.trident.return ambient @a[predicate=hvr:dimension/overworld] ~ ~ ~ 0.1 2 0.1