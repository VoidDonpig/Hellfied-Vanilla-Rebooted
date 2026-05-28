#> hvr:entity_manager/storage/gc/
#
# Remove no longer used storage
#
# @within function hvr:core/load/

# Copy data
    data modify storage hvr.__temp__:entity_manager/storage copied_stored_data set from storage hvr:entity_manager/storage stored_data

# Remove data
    execute if data storage hvr.__temp__:entity_manager/storage copied_stored_data[0] run function hvr:entity_manager/storage/gc/foreach

# Migrate data
    data modify storage hvr:entity_manager/storage stored_data set from storage hvr.__temp__:entity_manager/storage retained_data

# Reset
    data remove storage hvr.__temp__:entity_manager/storage retained_data
    data remove storage hvr.__temp__:entity_manager/storage copied_stored_data