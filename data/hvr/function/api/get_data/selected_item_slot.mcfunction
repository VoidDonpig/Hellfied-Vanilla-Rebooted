#> hvr:api/get_data/selected_item_slot
#
# Get data
#
# @output
#   storage
#       hvr:api SelectedItemSlot
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api SelectedItemSlot

# Migrate data
    data modify storage hvr:api SelectedItemSlot set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.SelectedItemSlot
