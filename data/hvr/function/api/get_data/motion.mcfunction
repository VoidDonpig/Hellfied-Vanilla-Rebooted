#> hvr:api/get_data/motion
#
# Get data
#
# @output
#   storage
#       hvr:api Motion
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api Motion

# Migrate data
    data modify storage hvr:api Motion set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Motion
