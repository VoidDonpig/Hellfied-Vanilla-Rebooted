#> hvr:api/get_data/locator_bar_icon
#
# Get data
#
# @output
#   storage
#       hvr:api locator_bar_icon
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api locator_bar_icon

# Migrate data
    data modify storage hvr:api locator_bar_icon set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.locator_bar_icon
