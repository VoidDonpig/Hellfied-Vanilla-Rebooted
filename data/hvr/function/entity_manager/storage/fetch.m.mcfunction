#> hvr:entity_manager/storage/fetch.m
#
# Fetch entity storage
#
# @within function hvr:api/storage/entity/fetch

# Evacuate existed data
    execute if data storage hvr.__temp__:entity_manager/storage fetched run function hvr:entity_manager/storage/save/

# Get storage
    $data modify storage hvr:entity_manager/storage fetched set from storage hvr:entity_manager/storage stored[{UUID:$(UUID)}]