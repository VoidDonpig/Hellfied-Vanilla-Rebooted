#> hvr:api/get_data/food_exhaustion_level
#
# Get data
#
# @output
#   storage
#       hvr:api foodExhaustionLevel
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api foodExhaustionLevel

# Migrate data
    data modify storage hvr:api foodExhaustionLevel set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.foodExhaustionLevel
