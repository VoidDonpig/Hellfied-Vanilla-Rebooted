#> hvr:entity_manager/storage/gc_free
#
# Initialize removed entity storage
#
# @within function
#   hvr:entity_manager/storage/gc
#   hvr:entity_manager/storage/gc_free

# Get storage
    function hvr:entity_manager/storage/provide

# Initialize data
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4] set value {}

# Remove the id from list
    data remove storage hvr:entity_manager/storage id[0]

# id[0] > max then continue removing storage
    execute store result score $ hvr.entity_storage_id run data get storage hvr:entity_manager/storage id[0]
    execute if score $ hvr.entity_storage_id > $ hvr.entity_storage run function hvr:entity_manager/storage/gc_free