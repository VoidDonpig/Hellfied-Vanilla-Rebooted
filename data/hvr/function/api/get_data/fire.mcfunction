#> hvr:api/get_data/fire
#
# Get data
#
# @output
#   storage
#       hvr:api Fire
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api Fire

# Migrate data
    data modify storage hvr:api Fire set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Fire
