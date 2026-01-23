#> hvr:api/get_data/_cache_bust
#
# Declare cache bust flag
#
# @input as entity
#
# @output storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache{cache_bust:true}
#
# @api

# Get storage
    function hvr:entity_manager/storage/access

# Declare flag
    data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.cache_bust set value true