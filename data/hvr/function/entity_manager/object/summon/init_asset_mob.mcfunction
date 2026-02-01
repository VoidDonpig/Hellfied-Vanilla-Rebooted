#> hvr:entity_manager/object/summon/init_asset_mob
#
# Initialize object
#
# @within function hvr:api/object/core/summon.m

# Finish init
    tag @s remove hvr.mob_need_init

# Add asset object tag
    tag @s add hvr.asset.object

# Add id tag
    $tag @s add hvr.asset.object.$(id)

# Init process
    function hvr:entity_manager/object/event/init/dispatch/m with storage hvr:api __input__

# Set field
    function hvr:entity_manager/storage/access
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].object_field set from storage hvr:asset/context this

# Reset
    data remove storage hvr:asset/context this