#> hvr:core/load/initialize_storage
#
# Initialization process of data storage
#
# @within function hvr:core/load/once

# Initialize storage
    data modify storage hvr:entity_manager/storage _ set value [[[[[[[[{},{},{},{}],[],[],[]],[],[],[]],[],[],[]],[],[],[]],[],[],[]],[],[],[]],[],[],[]]
    data modify storage hvr:core/rom _ set value [[[[[[[[{},{},{},{}],[],[],[]],[],[],[]],[],[],[]],[],[],[]],[],[],[]],[],[],[]],[],[],[]]

# Init ID Allocation of entity storage
    scoreboard objectives remove hvr.entity_storage_id
    scoreboard objectives add hvr.entity_storage_id dummy
    data modify storage hvr:entity_manager/storage id set value [0]