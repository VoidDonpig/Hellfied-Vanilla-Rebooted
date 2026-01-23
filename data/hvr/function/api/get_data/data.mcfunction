#> hvr:api/get_data/data
#
# Get data
#
# @output
#   storage
#       hvr:api data
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api data

# Migrate data
    data modify storage hvr:api data set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.data
