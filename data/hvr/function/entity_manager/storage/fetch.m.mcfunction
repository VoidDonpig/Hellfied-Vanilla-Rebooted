#> hvr:entity_manager/storage/fetch.m
#
# Fetch entity storage
#
# @within function hvr:api/storage/entity/fetch

# Evacuate existed data
    execute if data storage hvr:entity_manager/storage _ run function hvr:entity_manager/storage/save/

# Get storage
    $data modify storage hvr:entity_manager/storage _ set from storage hvr:entity_manager/storage stored_data[{owner_uuid:$(UUID)}]