#> hvr:entity_manager/mob/init/natural_mob
#
# Natural mob initialization
#
# @within function hvr:core/tick/main

# Define specific mobs as asset
    execute if entity @s[type=#hvr:process_target] run function hvr:entity_manager/mob/init/define_as_asset_mob

# Init mob
    execute unless entity @s[tag=hvr.asset.mob] run function hvr:entity_manager/mob/init/common