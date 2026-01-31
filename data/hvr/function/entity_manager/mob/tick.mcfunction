#> hvr:entity_manager/mob/tick
#
# Asset mob tick
#
# @within function hvr:core/tick/mob/

# Add target tag
    execute on target run tag @s add hvr.target

# Dispatch tick event
    function hvr:entity_manager/mob/event/tick/dispatch/

# Remove target
    tag @e[tag=hvr.target] remove hvr.target