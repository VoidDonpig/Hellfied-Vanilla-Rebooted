#> hvr:api/get_data/passengers
#
# Get data
#
# @output
#   storage
#       hvr:api Passengers
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api Passengers

# Migrate data
    data modify storage hvr:api Passengers set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Passengers
