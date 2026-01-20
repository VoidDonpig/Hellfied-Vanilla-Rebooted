#> hvr:entity_manager/mob/hurt/damage_type/is_melee
#
# When hurt by melee event
#
# @within enchantment hvr:entity_manager/mob/sys

# Declare damage type
    data modify storage hvr:entity_manager/mob damage_type set value "is_melee"

# Call event handler
    function hvr:entity_manager/mob/event/hurt/handler
