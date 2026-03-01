#> hvr:entity_manager/mob/init/convert_into_hazardous_mob
#
# Set id of hazardous mob
#
# @within function hvr:entity_manager/mob/init/define_as_asset_mob

# Inferno
    execute if entity @s[type=blaze] run data modify storage hvr:api __input__.id set value "enemy.hazardous.inferno"