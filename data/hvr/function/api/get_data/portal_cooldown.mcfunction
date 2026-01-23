#> hvr:api/get_data/portal_cooldown
#
# Get data
#
# @output
#   storage
#       hvr:api PortalCooldown
#
# @api

# Get cache
    function hvr:api/get_data/_fetch

# Remove old data
    data remove storage hvr:api PortalCooldown

# Migrate data
    data modify storage hvr:api PortalCooldown set from storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data.PortalCooldown
