#> hvr:api/get_data/data_version
#
# Get data
#
# @output
#   storage
#       hvr:api dataVersion
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api dataVersion

# Migrate data
    data modify storage hvr:api dataVersion set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.dataVersion
