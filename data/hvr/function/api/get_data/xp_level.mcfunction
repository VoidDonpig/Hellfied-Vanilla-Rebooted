#> hvr:api/get_data/xp_level
#
# Get data
#
# @output
#   storage
#       hvr:api XpLevel
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api XpLevel

# Migrate data
    data modify storage hvr:api XpLevel set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.XpLevel
