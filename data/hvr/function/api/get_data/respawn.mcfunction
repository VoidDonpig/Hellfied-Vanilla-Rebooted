#> hvr:api/get_data/respawn
#
# Get data
#
# @output
#   storage
#       hvr:api respawn
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api respawn

# Migrate data
    data modify storage hvr:api respawn set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.respawn
