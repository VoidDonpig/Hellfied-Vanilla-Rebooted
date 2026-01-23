#> hvr:api/get_data/last_death_location
#
# Get data
#
# @output
#   storage
#       hvr:api LastDeathLocation
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api LastDeathLocation

# Migrate data
    data modify storage hvr:api LastDeathLocation set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.LastDeathLocation
