#> hvr:asset/effect/ominous_bloodlust/given/
#
# Given event process
#
# @within function
#   hvr:entity_manager/effect/event/given/dispatch/m

# Calculate status increase
    execute store result score $ hvr.temporary run data get storage hvr:asset/context level
    scoreboard players set $_ hvr.temporary 10
    scoreboard players operation $ hvr.temporary *= $_ hvr.temporary
    scoreboard players set $__ hvr.temporary 50
    scoreboard players operation $ hvr.temporary < $__ hvr.temporary
    execute store result storage hvr.__temp__:asset/effect increase double 0.01 run scoreboard players get $ hvr.temporary

# Set attribute
    function hvr:asset/effect/ominous_bloodlust/given/set_attribute with storage hvr.__temp__:asset/effect

# Reset
    scoreboard players reset $ hvr.temporary
    scoreboard players reset $_ hvr.temporary
    scoreboard players reset $__ hvr.temporary
    data remove storage hvr.__temp__:asset/effect increase