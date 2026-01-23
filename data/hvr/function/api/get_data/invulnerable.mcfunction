#> hvr:api/get_data/invulnerable
#
# Get data
#
# @output
#   storage
#       hvr:api Invulnerable
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api Invulnerable

# Migrate data
    data modify storage hvr:api Invulnerable set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.Invulnerable
