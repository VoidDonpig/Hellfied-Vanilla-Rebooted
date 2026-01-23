#> hvr:api/get_data/ignore_fall_damage_from_current_explosion
#
# Get data
#
# @output
#   storage
#       hvr:api ignore_fall_damage_from_current_explosion
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api ignore_fall_damage_from_current_explosion

# Migrate data
    data modify storage hvr:api ignore_fall_damage_from_current_explosion set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.ignore_fall_damage_from_current_explosion
