#> hvr:api/get_data/_update
#
# Updata data
#
# @within function hvr:api/get_data/_fetch

# Stash
    data modify storage hvr:api data_cache_stash.Pos set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Pos

# Update
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data set from entity @s

# Restore from stash
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Pos set from storage hvr:api data_cache_stash.Pos

# Reset
    data remove storage hvr:api data_cache_stash
