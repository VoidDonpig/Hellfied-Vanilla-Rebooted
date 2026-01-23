#> hvr:api/get_data/seen_credits
#
# Get data
#
# @output
#   storage
#       hvr:api seenCredits
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api seenCredits

# Migrate data
    data modify storage hvr:api seenCredits set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.seenCredits
