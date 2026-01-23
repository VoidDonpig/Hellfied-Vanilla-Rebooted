#> hvr:api/get_data/xp_seed
#
# Get data
#
# @output
#   storage
#       hvr:api XpSeed
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api XpSeed

# Migrate data
    data modify storage hvr:api XpSeed set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.XpSeed
