#> hvr:api/get_data/inventory
#
# Get data
#
# @output
#   storage
#       hvr:api Inventory
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api Inventory

# Migrate data
    data modify storage hvr:api Inventory set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Inventory
