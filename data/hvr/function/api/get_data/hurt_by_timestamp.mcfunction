#> hvr:api/get_data/hurt_by_timestamp
#
# Get data
#
# @output
#   storage
#       hvr:api HurtByTimestamp
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api HurtByTimestamp

# Migrate data
    data modify storage hvr:api HurtByTimestamp set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.HurtByTimestamp
