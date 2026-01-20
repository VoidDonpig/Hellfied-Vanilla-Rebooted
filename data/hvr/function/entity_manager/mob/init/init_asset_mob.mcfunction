#> hvr:entity_manager/mob/init/init_asset_mob
#
# Initialize mob
#
# @within function hvr:api/mob/core/summon

# Finish init
    tag @s remove hvr.mob_need_init

# Add asset mob tag
    tag @s add hvr.mob_asset

# Add id tag
    $tag @s add hvr.mob_asset.$(id)

# Set data
    function hvr:entity_manager/mob/init/set_data_from_register

# Init process
    function hvr:entity_manager/mob/event/init/dispatch/dispatcher.m with storage hvr:api __input__

# Set field
    function hvr:entity_manager/storage/access
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].mob_field set from storage hvr:asset/context this

# Reset
    data remove storage hvr:asset/context this