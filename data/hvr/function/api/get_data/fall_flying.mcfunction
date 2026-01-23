#> hvr:api/get_data/fall_flying
#
# Get data
#
# @output
#   storage
#       hvr:api FallFlying
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api FallFlying

# Migrate data
    data modify storage hvr:api FallFlying set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.FallFlying
