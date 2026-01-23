#> hvr:api/get_data/uuid
#
# Get data
#
# @output
#   storage
#       hvr:api UUID
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api UUID

# Migrate data
    data modify storage hvr:api UUID set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.UUID
