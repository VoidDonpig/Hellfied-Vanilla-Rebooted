#> hvr:entity_manager/mob/summon/init_asset_mob
#
# Initialize mob
#
# @within function hvr:api/mob/core/summon.m

# Finish init
    tag @s remove hvr.mob_need_init

# Add asset mob tag
    tag @s add hvr.asset.mob

# Add id tag
    $tag @s add hvr.asset.mob.$(id)

# Set data
    function hvr:entity_manager/mob/summon/set_data_from_register

# Init process
    function hvr:entity_manager/mob/event/init/dispatch/m with storage hvr:api __input__

# Set field
    function hvr:api/storage/entity/fetch
    data modify storage hvr:entity_manager/storage fetched.mob_field set from storage hvr:asset/context this

# Reset
    data remove storage hvr:asset/context this