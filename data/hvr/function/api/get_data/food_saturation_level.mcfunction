#> hvr:api/get_data/food_saturation_level
#
# Get data
#
# @output
#   storage
#       hvr:api foodSaturationLevel
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api foodSaturationLevel

# Migrate data
    data modify storage hvr:api foodSaturationLevel set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.foodSaturationLevel
