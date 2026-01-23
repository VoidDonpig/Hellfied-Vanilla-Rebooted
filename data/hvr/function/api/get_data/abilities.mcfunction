#> hvr:api/get_data/abilities
#
# Get data
#
# @output
#   storage
#       hvr:api abilities
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api abilities

# Migrate data
    data modify storage hvr:api abilities set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.abilities
