#> hvr:entity_manager/player/event/death/handler
#
# Death event handler
#
# @within function hvr:core/tick/player/post

# Add death tag
    tag @s add hvr.player_death

# Remove effects on death
    execute if entity @s[tag=hvr.have_asset_effect] run function hvr:entity_manager/effect/on_death/

# Reset
    scoreboard players reset @s hvr.death_event