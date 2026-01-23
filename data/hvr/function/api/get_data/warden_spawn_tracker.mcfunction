#> hvr:api/get_data/warden_spawn_tracker
#
# Get data
#
# @output
#   storage
#       hvr:api warden_spawn_tracker
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api warden_spawn_tracker

# Migrate data
    data modify storage hvr:api warden_spawn_tracker set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.warden_spawn_tracker
