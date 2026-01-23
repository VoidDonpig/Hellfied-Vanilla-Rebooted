#> hvr:api/get_data/tags
#
# Get data
#
# @output
#   storage
#       hvr:api Tags
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api Tags

# Migrate data
    data modify storage hvr:api Tags set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Tags
