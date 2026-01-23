#> hvr:api/get_data/entered_nether_pos
#
# Get data
#
# @output
#   storage
#       hvr:api entered_nether_pos
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api entered_nether_pos

# Migrate data
    data modify storage hvr:api entered_nether_pos set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.entered_nether_pos
