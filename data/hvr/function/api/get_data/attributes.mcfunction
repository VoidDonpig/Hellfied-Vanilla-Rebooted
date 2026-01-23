#> hvr:api/get_data/attributes
#
# Get data
#
# @output
#   storage
#       hvr:api attributes
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api attributes

# Migrate data
    data modify storage hvr:api attributes set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.attributes
