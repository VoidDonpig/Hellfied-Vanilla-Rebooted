#> hvr:api/get_data/xp_total
#
# Get data
#
# @output
#   storage
#       hvr:api XpTotal
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api XpTotal

# Migrate data
    data modify storage hvr:api XpTotal set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.XpTotal
