#> hvr:entity_manager/storage/save/
#
# Save fetched storage
#
# @within function hvr:entity_manager/storage/allocate

# Get UUID
    data modify storage hvr.__temp__:entity_manager/storage target_uuid set from storage hvr:entity_manager/storage _.owner_uuid

# Save via macro
    function hvr:entity_manager/storage/save/m with storage hvr.__temp__:entity_manager/storage

# Reset
    data remove storage hvr.__temp__:entity_manager/storage target_uuid