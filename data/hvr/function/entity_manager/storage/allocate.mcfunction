#> hvr:entity_manager/storage/allocate
#
# Allocate entity storage to executor
#
# @within function hvr:api/storage/entity/fetch

# Evacuate existed data
    execute if data storage hvr:entity_manager/storage _ run function hvr:entity_manager/storage/save/

# Get UUID directly even if player called this because the cache cannot generate and loop infinitely
    data modify storage hvr.__temp__:entity_manager/storage constructing_storage.owner_uuid set from entity @s UUID
    data modify storage hvr.__temp__:entity_manager/storage constructing_storage._ set value {}

# Merge artifact
    data modify storage hvr:entity_manager/storage _ set from storage hvr.__temp__:entity_manager/storage constructing_storage
    data modify storage hvr:entity_manager/storage stored append from storage hvr.__temp__:entity_manager/storage constructing_storage

# Add allocated flag tag
    tag @s add hvr.entity_manager.already_allocated_storage

# Reset
    data remove storage hvr.__temp__:entity_manager/storage constructing_storage