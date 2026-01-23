#> hvr:api/get_data/rotation
#
# Get data
#
# @output
#   storage
#       hvr:api Rotation
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api Rotation

# Migrate data
    data modify storage hvr:api Rotation set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Rotation
