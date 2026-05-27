#> hvr:entity_manager/storage/gc/foreach
#
# Remove data until all unused data removed
#
# @within function hvr:entity_manager/storage/gc/

# Copy target data
    data modify storage hvr.__temp__:entity_manager/storage target_data set from storage hvr.__temp__:entity_manager/storage copied_stored_data[-1]

# Check entity existence
    function hvr:entity_manager/storage/gc/check_entity_existence.m with storage hvr.__temp__:entity_manager/storage target_data

# If not existed, remove data
    execute unless score $existed hvr.temporary matches 1 run data remove storage hvr.__temp__:entity_manager/storage target_data

# IF existed, keep
    execute if score $existed hvr.temporary matches 1 run data modify storage hvr.__temp__:entity_manager/storage retained_data append from storage hvr.__temp__:entity_manager/storage target_data

# Reset
    data remove storage hvr.__temp__:entity_manager/storage target_data
    scoreboard players reset $existed hvr.temporary

# Remove footer
    data remove storage hvr.__temp__:entity_manager/storage copied_stored_data[-1]

# Repeat until all data processed
    execute if data storage hvr.__temp__:entity_manager/storage target_data[0] run function hvr:entity_manager/storage/gc/foreach