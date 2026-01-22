#> hvr:entity_manager/effect/tick
#
# Asset effect tick process
#
# @within function hvr:core/tick/main

# Get storage
    function hvr:entity_manager/storage/access

# Open session
    function hvr:lib/array/session/open

# Get current effect
    data modify storage hvr:lib array set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects
    function hvr:lib/array/reverse
    data modify storage hvr:asset/effect effects set from storage hvr:lib array
    # Remove origin
        data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects

# Close session
    function hvr:lib/array/session/close

# If effects exist, process foreach
    data modify storage hvr:asset/effect hand_over_effects set value []
    execute if data storage hvr:asset/effect effects[0] run function hvr:entity_manager/effect/foreach

# Get storage again
    function hvr:entity_manager/storage/access

# Restore effects
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects append from storage hvr:asset/effect hand_over_effects[]

# If doesn't have effect, remove tag
    execute unless data storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects[0] run tag @s remove hvr.have_asset_effect

# Reset
    scoreboard players reset @s hvr.used_milk
    scoreboard players reset @s hvr.used_totem
    data remove storage hvr:asset/effect effects
    data remove storage hvr:asset/effect hand_over_effects