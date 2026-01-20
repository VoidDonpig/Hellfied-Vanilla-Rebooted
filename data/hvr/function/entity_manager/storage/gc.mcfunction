#> hvr:entity_manager/storage/gc
#
# GC
#
# @within function
#   hvr:entity_manager/storage/allocate_id
#   hvr:entity_manager/storage/gc

# Trim id data
    data modify storage hvr:entity_manager/storage id append from storage hvr:entity_manager/storage id[0]
    data remove storage hvr:entity_manager/storage id[0]
    execute store result score $ hvr.entity_storage run data get storage hvr:entity_manager/storage id[0]
    scoreboard players remove $ hvr.entity_storage 2147483647
    scoreboard players set $ hvr.entity_storage_id 0
    scoreboard players operation * hvr.entity_storage_id -= $ hvr.entity_storage
    scoreboard players operation $ hvr.entity_storage_id > * hvr.entity_storage_id
    scoreboard players operation * hvr.entity_storage_id += $ hvr.entity_storage
    scoreboard players operation $ hvr.entity_storage >< $ hvr.entity_storage_id
    execute store result score $ hvr.entity_storage_id run data get storage hvr:entity_manager/storage id[0]
    execute if score $ hvr.entity_storage_id > $ hvr.entity_storage run function hvr:entity_manager/storage/gc_free
    scoreboard players operation $ hvr.entity_storage >< $ hvr.entity_storage_id
    execute store result score $ hvr.entity_storage run data get storage hvr:entity_manager/storage id[-1]
    execute if score $ hvr.entity_storage matches 0 run scoreboard players add $ hvr.entity_storage 65536
    execute if score $ hvr.entity_storage_id matches 0 run scoreboard players add $ hvr.entity_storage 65536
    execute if score $ hvr.entity_storage_id matches 0 run scoreboard players add $ hvr.entity_storage_id 65536
    scoreboard players operation $ hvr.entity_storage += $ hvr.entity_storage
    scoreboard players operation $ hvr.entity_storage -= $ hvr.entity_storage_id
    scoreboard players operation $ hvr.entity_storage -= $ hvr.entity_storage_id
    scoreboard players operation $ hvr.entity_storage_id -= $ hvr.entity_storage
    execute store result score $ hvr.entity_storage run data get storage hvr:entity_manager/storage id[1]
    scoreboard players operation $ hvr.entity_storage_id -= $ hvr.entity_storage
    execute if score $ hvr.entity_storage_id matches -1.. run function hvr:entity_manager/storage/gc