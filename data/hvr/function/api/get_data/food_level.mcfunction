#> hvr:api/get_data/food_level
#
# Get data
#
# @output
#   storage
#       hvr:api foodLevel
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api foodLevel

# Migrate data
    data modify storage hvr:api foodLevel set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.foodLevel
