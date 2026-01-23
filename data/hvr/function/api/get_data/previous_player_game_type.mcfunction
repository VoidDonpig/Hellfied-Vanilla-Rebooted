#> hvr:api/get_data/previous_player_game_type
#
# Get data
#
# @output
#   storage
#       hvr:api previousPlayerGameType
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api previousPlayerGameType

# Migrate data
    data modify storage hvr:api previousPlayerGameType set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.previousPlayerGameType
