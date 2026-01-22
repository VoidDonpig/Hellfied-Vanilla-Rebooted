#> hvr:entity_manager/effect/on_death/get_data_and_proceed
#
# Remove effects
#
# @within function hvr:entity_manager/player/event/death/handler

# Get storage
    function hvr:entity_manager/storage/access

# Get current effect
    data modify storage hvr:asset/effect effects set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects
    # Remove origin
        data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects

# If effects exist, process foreach
    execute if data storage hvr:asset/effect effects[0] run function hvr:entity_manager/effect/on_death/foreach

# Get storage again
    function hvr:entity_manager/storage/access

# Restore effects
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects append from storage hvr:asset/effect hand_over_effects[]

# If doesn't have effect, remove tag
    execute unless data storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].effects[0] run tag @s remove hvr.have_asset_effect

# Reset
    data remove storage hvr:asset/effect effects
    data remove storage hvr:asset/effect hand_over_effects