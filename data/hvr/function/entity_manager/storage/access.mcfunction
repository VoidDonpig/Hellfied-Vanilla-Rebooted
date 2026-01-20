#> hvr:entity_manager/storage/access
#
# Access the entity own storage
#
# @input as entity
#
# @output storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4]
#   the entity's storage
#
# @internal

# Provide new ID if not have
    execute unless score @s hvr.entity_storage_id matches 1.. run function hvr:entity_manager/storage/allocate_id

# Move id
    execute unless score @s hvr.entity_storage_id = $latest_called_id hvr.entity_storage run scoreboard players operation $ hvr.entity_storage_id = @s hvr.entity_storage_id

# Access data
    execute unless score @s hvr.entity_storage_id = $latest_called_id hvr.entity_storage run function hvr:entity_manager/storage/provide