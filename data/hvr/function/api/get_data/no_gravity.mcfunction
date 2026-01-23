#> hvr:api/get_data/no_gravity
#
# Get data
#
# @output
#   storage
#       hvr:api NoGravity
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api NoGravity

# Migrate data
    data modify storage hvr:api NoGravity set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.NoGravity
