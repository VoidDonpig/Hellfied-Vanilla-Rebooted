#> hvr:api/get_data/shoulder_entity_left
#
# Get data
#
# @output
#   storage
#       hvr:api ShoulderEntityLeft
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api ShoulderEntityLeft

# Migrate data
    data modify storage hvr:api ShoulderEntityLeft set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.ShoulderEntityLeft
