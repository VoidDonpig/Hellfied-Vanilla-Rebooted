#> hvr:entity_manager/storage/provide
#
# data shifter function
#
# @within function
#   hvr:entity_manager/storage/access
#   hvr:entity_manager/storage/gc_free

# Record latest called id
    scoreboard players operation $latest_called_id hvr.entity_storage = @s hvr.entity_storage_id

# Reset
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][6]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][5]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][4]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][6]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][5]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][4]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][6]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][5]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][4]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][6]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][5]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][-4][4]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][6]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][5]
    data remove storage hvr:entity_manager/storage _[-4][-4][-4][4]
    data remove storage hvr:entity_manager/storage _[-4][-4][6]
    data remove storage hvr:entity_manager/storage _[-4][-4][5]
    data remove storage hvr:entity_manager/storage _[-4][-4][4]
    data remove storage hvr:entity_manager/storage _[-4][6]
    data remove storage hvr:entity_manager/storage _[-4][5]
    data remove storage hvr:entity_manager/storage _[-4][4]
    data remove storage hvr:entity_manager/storage _[6]
    data remove storage hvr:entity_manager/storage _[5]
    data remove storage hvr:entity_manager/storage _[4]

# Copy for calculation
    scoreboard players operation $ hvr.entity_storage_id *= $65536 hvr.constant

# Shift1
    execute if score $ hvr.entity_storage_id matches 1073741824.. run data modify storage hvr:entity_manager/storage _ append value []
    execute if score $ hvr.entity_storage_id matches ..-1073741825 run data modify storage hvr:entity_manager/storage _ append from storage hvr:global two_empty_lists[]
    execute if score $ hvr.entity_storage_id matches -1073741824..-1 run data modify storage hvr:entity_manager/storage _ append from storage hvr:global three_empty_lists[]
    
# Check2 + shift2
    execute unless data storage hvr:entity_manager/storage _[-4][0] run data modify storage hvr:entity_manager/storage _[-4] set from storage hvr:global initial[0]
    scoreboard players operation $ hvr.entity_storage_id *= $4 hvr.constant
    execute if score $ hvr.entity_storage_id matches 1073741824.. run data modify storage hvr:entity_manager/storage _[-4] append value []
    execute if score $ hvr.entity_storage_id matches ..-1073741825 run data modify storage hvr:entity_manager/storage _[-4] append from storage hvr:global two_empty_lists[]
    execute if score $ hvr.entity_storage_id matches -1073741824..-1 run data modify storage hvr:entity_manager/storage _[-4] append from storage hvr:global three_empty_lists[]

# Check3 + shift3
    execute unless data storage hvr:entity_manager/storage _[-4][-4][0] run data modify storage hvr:entity_manager/storage _[-4][-4] set from storage hvr:global initial[0][0]
    scoreboard players operation $ hvr.entity_storage_id *= $4 hvr.constant
    execute if score $ hvr.entity_storage_id matches 1073741824.. run data modify storage hvr:entity_manager/storage _[-4][-4] append value []
    execute if score $ hvr.entity_storage_id matches ..-1073741825 run data modify storage hvr:entity_manager/storage _[-4][-4] append from storage hvr:global two_empty_lists[]
    execute if score $ hvr.entity_storage_id matches -1073741824..-1 run data modify storage hvr:entity_manager/storage _[-4][-4] append from storage hvr:global three_empty_lists[]

# Check4 + shift4
    execute unless data storage hvr:entity_manager/storage _[-4][-4][-4][0] run data modify storage hvr:entity_manager/storage _[-4][-4][-4] set from storage hvr:global initial[0][0][0]
    scoreboard players operation $ hvr.entity_storage_id *= $4 hvr.constant
    execute if score $ hvr.entity_storage_id matches 1073741824.. run data modify storage hvr:entity_manager/storage _[-4][-4][-4] append value []
    execute if score $ hvr.entity_storage_id matches ..-1073741825 run data modify storage hvr:entity_manager/storage _[-4][-4][-4] append from storage hvr:global two_empty_lists[]
    execute if score $ hvr.entity_storage_id matches -1073741824..-1 run data modify storage hvr:entity_manager/storage _[-4][-4][-4] append from storage hvr:global three_empty_lists[]

# Check5 + shift5
    execute unless data storage hvr:entity_manager/storage _[-4][-4][-4][-4][0] run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4] set from storage hvr:global initial[0][0][0][0]
    scoreboard players operation $ hvr.entity_storage_id *= $4 hvr.constant
    execute if score $ hvr.entity_storage_id matches 1073741824.. run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4] append value []
    execute if score $ hvr.entity_storage_id matches ..-1073741825 run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4] append from storage hvr:global two_empty_lists[]
    execute if score $ hvr.entity_storage_id matches -1073741824..-1 run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4] append from storage hvr:global three_empty_lists[]

# Check6 + shift6
    execute unless data storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][0] run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4] set from storage hvr:global initial[0][0][0][0][0]
    scoreboard players operation $ hvr.entity_storage_id *= $4 hvr.constant
    execute if score $ hvr.entity_storage_id matches 1073741824.. run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4] append value []
    execute if score $ hvr.entity_storage_id matches ..-1073741825 run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4] append from storage hvr:global two_empty_lists[]
    execute if score $ hvr.entity_storage_id matches -1073741824..-1 run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4] append from storage hvr:global three_empty_lists[]

# Check7 + shift7
    execute unless data storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][0] run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4] set from storage hvr:global initial[0][0][0][0][0][0]
    scoreboard players operation $ hvr.entity_storage_id *= $4 hvr.constant
    execute if score $ hvr.entity_storage_id matches 1073741824.. run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4] append value []
    execute if score $ hvr.entity_storage_id matches ..-1073741825 run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4] append from storage hvr:global two_empty_lists[]
    execute if score $ hvr.entity_storage_id matches -1073741824..-1 run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4] append from storage hvr:global three_empty_lists[]

# Check8 + shift8
    execute unless data storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][0] run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4] set from storage hvr:global initial[0][0][0][0][0][0][0]
    scoreboard players operation $ hvr.entity_storage_id *= $4 hvr.constant
    execute if score $ hvr.entity_storage_id matches 1073741824.. run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4] append value {}
    execute if score $ hvr.entity_storage_id matches ..-1073741825 run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4] append from storage hvr:global two_empty_maps[]
    execute if score $ hvr.entity_storage_id matches -1073741824..-1 run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4] append from storage hvr:global three_empty_maps[]