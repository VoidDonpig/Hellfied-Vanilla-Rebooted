#> hvr:entity_manager/mob/restore_status
#
# Force restore status
#
# @within function hvr:core/tick/mob/pre

# If not asset mob, just restore sys ench and allocate new id and tag
    execute if entity @s[tag=!hvr.mob_asset] run return run function hvr:entity_manager/mob/init/common

# Get id
    execute if entity @s[type=!slime,type=!magma_cube] run function hvr:entity_manager/storage/access
    execute if entity @s[type=!slime,type=!magma_cube] run data modify storage hvr:api __input__.id set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].id

# If slime or magma cube, init as natural mob
    execute if entity @s[type=slime] run data modify storage hvr:api __input__.id set value "slime"
    execute if entity @s[type=magma_cube] run data modify storage hvr:api __input__.id set value "magma_cube"

# Tag this mob
    tag @s add hvr.mob_need_init

# Init via summon api
    data modify storage hvr:api __input__.skip_summon set value true
    function hvr:api/mob/summon