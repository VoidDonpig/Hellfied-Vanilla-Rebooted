#> hvr:entity_manager/effect/give/format_data
#
# Format data
#
# @within function hvr:entity_manager/effect/give/

# Get score
    execute store result score $origin_duration hvr.temporary run data get storage hvr:asset/effect target_effect_data.duration
    execute store result score $duration hvr.temporary run data get storage hvr:asset/effect duration
    execute store result score $origin_Level hvr.temporary run data get storage hvr:asset/effect target_effect_data.level
    execute store result score $level hvr.temporary run data get storage hvr:asset/effect level

# Update
    execute if data storage hvr:asset/effect {level_operation:"replace"} run scoreboard players operation $level hvr.temporary > $origin_Level hvr.temporary
    execute if data storage hvr:asset/effect {duration_operation:"replace"} if score $level hvr.temporary >= $origin_Level hvr.temporary run scoreboard players operation $duration hvr.temporary > $origin_duration hvr.temporary
    execute if data storage hvr:asset/effect {level_operation:"add"} run scoreboard players operation $level hvr.temporary += $origin_Level hvr.temporary
    execute if data storage hvr:asset/effect {duration_operation:"add"} run scoreboard players operation $duration hvr.temporary += $origin_duration hvr.temporary
    execute if data storage hvr:asset/effect {level_operation:"force"} run scoreboard players operation $level hvr.temporary = $origin_Level hvr.temporary
    execute if data storage hvr:asset/effect {duration_operation:"force"} run scoreboard players operation $duration hvr.temporary = $origin_duration hvr.temporary

# Clamp
    scoreboard players operation $level hvr.temporary > $1 hvr.constant
    scoreboard players operation $level hvr.temporary < $255 hvr.constant
    scoreboard players operation $duration hvr.temporary > $1 hvr.constant
    scoreboard players operation $duration hvr.temporary < $10000000 hvr.constant

# Insert data
    data modify storage hvr:asset/effect effect_data set value {}

    data modify storage hvr:asset/effect effect_data.id set from storage hvr:asset/effect id
    execute store result storage hvr:asset/effect effect_data.duration int 1 run scoreboard players get $duration hvr.temporary
    execute store result storage hvr:asset/effect effect_data.level int 1 run scoreboard players get $level hvr.temporary
    data modify storage hvr:asset/effect effect_data.removed_on_using_milk set from storage hvr:asset/effect removed_on_using_milk
    data modify storage hvr:asset/effect effect_data.removed_on_death set from storage hvr:asset/effect removed_on_death
    data modify storage hvr:asset/effect effect_data.field set from storage hvr:asset/effect field
    execute if data storage hvr:asset/effect target_effect_data.field run data modify storage hvr:asset/effect effect_data.previous_field set from storage hvr:asset/effect target_effect_data.field

# Set event queue
    execute unless data storage hvr:asset/effect target_effect_data run data modify storage hvr:asset/effect effect_data.queued_event set value "given"
    execute if data storage hvr:asset/effect target_effect_data run data modify storage hvr:asset/effect effect_data.queued_event set value "regiven"

# Reset
    scoreboard players reset $duration hvr.temporary
    scoreboard players reset $level hvr.temporary
    scoreboard players reset $origin_duration hvr.temporary
    scoreboard players reset $origin_level hvr.temporary
