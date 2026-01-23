#> hvr:entity_manager/object/init/init_asset_object
#
# Initialize object
#
# @within function hvr:api/object/core/summon.m

# Call storage
    function hvr:entity_manager/storage/access

# Finish init
    tag @s remove hvr.mob_need_init

# Provide id
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].id set from storage hvr:api __input__.id

# Context
    data modify storage hvr:asset/context id set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].id

# Add asset object tag
    tag @s add hvr.object_asset

# Add id tag
    $tag @s add hvr.object_asset.$(id)

# Init process
    function hvr:entity_manager/object/event/init/dispatch/dispatcher.m with storage hvr:api __input__

# Reset
    data remove storage hvr:asset/context id
    data remove storage hvr:asset/object id
    data remove storage hvr:asset/object is_prop