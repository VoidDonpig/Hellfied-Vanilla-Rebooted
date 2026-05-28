#> hvr:core/load/initialize_storage
#
# Initialization process of data storage
#
# @within function hvr:core/load/once

# Initialize storage
    data merge storage hvr:entity_manager/storage {stored_data:[],_:{}}
    data merge storage hvr:core/rom {stored_data:[],_:{}}

# Add score objective
    #scoreboard objectives add hvr.entity_manager.storage dummy
    scoreboard objectives add hvr.entity_manager.storage.id dummy

# Declare flag
    data modify storage hvr:core initialized_storage set value true