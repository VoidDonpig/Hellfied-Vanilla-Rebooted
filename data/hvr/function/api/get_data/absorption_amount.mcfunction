#> hvr:api/get_data/absorption_amount
#
# Get data
#
# @output
#   storage
#       hvr:api AbsorptionAmount
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api AbsorptionAmount

# Migrate data
    data modify storage hvr:api AbsorptionAmount set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.AbsorptionAmount
