#> hvr:api/get_data/on_ground
#
# Get data
#
# @output
#   storage
#       hvr:api OnGround
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api OnGround

# Migrate data
    data modify storage hvr:api OnGround set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.OnGround
