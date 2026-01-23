#> hvr:api/get_data/selected_item
#
# Get data
#
# @output
#   storage
#       hvr:api SelectedItem
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api SelectedItem

# Migrate data
    data modify storage hvr:api SelectedItem set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.SelectedItem
