#> hvr:entity_manager/mob/hurt/damage_type/is_projectile
#
# When hurt by projectile event
#
# @within enchantment hvr:entity_manager/mob/sys

# Declare damage type
    data modify storage hvr:entity_manager/mob damage_type set value "is_projectile"

# Call event handler
    function hvr:entity_manager/mob/event/hurt/handler
