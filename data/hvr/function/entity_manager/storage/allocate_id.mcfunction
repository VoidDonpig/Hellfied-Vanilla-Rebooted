#> hvr:entity_manager/storage/allocate_id
#
# Allocate new id to dispatcher entity
#
# @within function hvr:entity_manager/storage/access

# Garbage collector
    function hvr:entity_manager/storage/gc

# Allocate id
    execute store result score $ hvr.entity_storage_id run data get storage hvr:entity_manager/storage id[-1]
    execute store result score $ hvr.entity_storage run data get storage hvr:entity_manager/storage id[0]
    # Prevent upround
        execute if score $ hvr.entity_storage_id matches 0 run scoreboard players set $ hvr.entity_storage_id 65536

    scoreboard players operation $ hvr.entity_storage_id += $ hvr.entity_storage
    scoreboard players operation $ hvr.entity_storage_id /= $2 hvr.constant

    scoreboard players operation @s hvr.entity_storage_id = $ hvr.entity_storage_id

    data modify storage hvr:entity_manager/storage id append value -1
    execute store result storage hvr:entity_manager/storage id[-1] int 1 run scoreboard players get $ hvr.entity_storage_id