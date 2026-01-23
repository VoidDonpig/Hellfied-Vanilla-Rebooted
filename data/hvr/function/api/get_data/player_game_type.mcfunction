#> hvr:api/get_data/player_game_type
#
# Get data
#
# @output
#   storage
#       hvr:api playerGameType
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api playerGameType

# Migrate data
    data modify storage hvr:api playerGameType set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.playerGameType
