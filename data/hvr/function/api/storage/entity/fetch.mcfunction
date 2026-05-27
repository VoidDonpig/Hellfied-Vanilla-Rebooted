#> hvr:api/storage/entity/fetch
#
# Fetch entity-specific storage
#
# @input
#   as entity
#
# @api

# Validation
    execute unless entity @s run return run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"hvr:api/storage/entity/fetch "},{text:"must be called from entity",color:"red"}]

# If not have allocated storage, then do
    execute if entity @s[tag=!hvr.entity_manager.already_allocated_storage] run return run function hvr:entity_manager/storage/allocate

# Get UUID of entity
    execute if entity @s[type=player] run function hvr:api/get_data/uuid
    execute if entity @s[type=!player] run data modify storage hvr:api UUID set from entity @s UUID

# Fetch storage
    function hvr:entity_manager/storage/fetch.m with storage hvr:api

# Reset
    data remove storage hvr:api UUID