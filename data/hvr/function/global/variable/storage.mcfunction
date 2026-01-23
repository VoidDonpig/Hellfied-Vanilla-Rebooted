#> hvr:global/variable/storage
#
# Set common storage data
#
# @within function hvr:core/load_once

# data for storage shifter
    data modify storage hvr:global two_empty_maps set value [{},{}]
    data modify storage hvr:global three_empty_maps set value [{},{},{}]
    data modify storage hvr:global two_empty_lists set value [[],[]]
    data modify storage hvr:global three_empty_lists set value [[],[],[]]
    data modify storage hvr:global initial set value [[[[[[[[{},{},{},{}],[],[],[]],[],[],[]],[],[],[]],[],[],[]],[],[],[]],[],[],[]],[],[],[]]