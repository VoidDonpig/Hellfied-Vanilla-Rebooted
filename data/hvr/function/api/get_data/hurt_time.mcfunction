#> hvr:api/get_data/hurt_time
#
# Get data
#
# @output
#   storage
#       hvr:api HurtTime
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api HurtTime

# Migrate data
    data modify storage hvr:api HurtTime set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.HurtTime
