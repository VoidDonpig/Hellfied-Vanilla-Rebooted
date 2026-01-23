#> hvr:api/get_data/has_visual_fire
#
# Get data
#
# @output
#   storage
#       hvr:api HasVisualFire
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api HasVisualFire

# Migrate data
    data modify storage hvr:api HasVisualFire set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.HasVisualFire
