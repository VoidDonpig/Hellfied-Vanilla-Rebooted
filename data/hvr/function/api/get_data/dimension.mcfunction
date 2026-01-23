#> hvr:api/get_data/dimension
#
# Get data
#
# @output
#   storage
#       hvr:api Dimension
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api Dimension

# Migrate data
    data modify storage hvr:api Dimension set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Dimension
