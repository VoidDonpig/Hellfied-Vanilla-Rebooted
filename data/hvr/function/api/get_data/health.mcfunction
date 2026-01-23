#> hvr:api/get_data/health
#
# Get data
#
# @output
#   storage
#       hvr:api Health
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api Health

# Migrate data
    data modify storage hvr:api Health set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Health
