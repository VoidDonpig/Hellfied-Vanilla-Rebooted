#> hvr:world_manager/phenomenon/overworld/meteor/
#
# Meteor
#
# @within function hvr:world_manager/phenomenon/overworld/

# Interval
    scoreboard players add $meteor_draw_interval hvr.world 1
    # Draw
        execute if score $meteor_draw_interval hvr.world matches 1200 run function hvr:world_manager/phenomenon/overworld/meteor/draw
    # Reset
        execute if score $meteor_draw_interval hvr.world matches 1200.. run scoreboard players set $meteor_draw_interval hvr.world 0

# Reset
    scoreboard players reset $ hvr.temporary
    scoreboard players reset $_ hvr.temporary