#> hvr:api/get_data/ender_items
#
# Get data
#
# @output
#   storage
#       hvr:api EnderItems
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api EnderItems

# Migrate data
    data modify storage hvr:api EnderItems set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.EnderItems
