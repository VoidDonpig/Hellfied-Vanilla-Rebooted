#> hvr:api/get_data/_fetch
#
# Get data
#
# @within function hvr:api/get_data/**

#> Define the data is latest
# @private
#declare score_holder $not_latest

# Get storage
    function hvr:entity_manager/storage/access

# Get or cache_bust == true then update cache
    execute store result score $not_latest hvr.temporary run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.time set from storage hvr:global time
    execute if score $not_latest hvr.temporary matches 0 if data storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache{cache_bust:true} run function hvr:api/get_data/_update
    execute if score $not_latest hvr.temporary matches 1 run data modify storage hvr:entity_manager/storage _[-4][-4][-4][-4][-4][-4][-4][-4].data_cache.data set from entity @s

# Reset
    scoreboard players reset $not_latest hvr.temporary
