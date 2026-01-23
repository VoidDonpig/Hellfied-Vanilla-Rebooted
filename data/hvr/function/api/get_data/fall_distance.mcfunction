#> hvr:api/get_data/fall_distance
#
# Get data
#
# @output
#   storage
#       hvr:api fall_distance
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api fall_distance

# Migrate data
    data modify storage hvr:api fall_distance set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.fall_distance
