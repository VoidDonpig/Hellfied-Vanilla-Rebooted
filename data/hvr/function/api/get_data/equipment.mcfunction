#> hvr:api/get_data/equipment
#
# Get data
#
# @output
#   storage
#       hvr:api equipment
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api equipment

# Migrate data
    data modify storage hvr:api equipment set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.equipment
