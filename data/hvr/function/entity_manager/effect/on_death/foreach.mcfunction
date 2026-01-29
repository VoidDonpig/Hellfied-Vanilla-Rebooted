#> hvr:entity_manager/effect/on_death/foreach
#
# Remove effects until all effects checked
#
# @within function
#   hvr:entity_manager/effect/on_death/get_data_and_proceed
#   hvr:entity_manager/effect/on_death/foreach

# Get target effect
    data modify storage hvr:asset/effect target_effect set from storage hvr:asset/effect effects[0]

# Remove effect if can
    execute if data storage hvr:asset/effect target_effect{removed_on_death:true} run data modify storage hvr:asset/effect target_effect.duration set value -1

# Generate context
    data modify storage hvr:asset/context id set from storage hvr:asset/effect target_effect.id
    data modify storage hvr:asset/context duration set from storage hvr:asset/effect target_effect.duration
    data modify storage hvr:asset/context level set from storage hvr:asset/effect target_effect.level
    data modify storage hvr:asset/context self set from storage hvr:asset/effect target_effect.field
    data modify storage hvr:asset/context previous_field set from storage hvr:asset/effect target_effect.previous_field

# Restore field
    data modify storage hvr:asset/effect target_effect.duration set from storage hvr:asset/context duration
    data modify storage hvr:asset/effect target_effect.field set from storage hvr:asset/context self

# Remove effect duration is out
    execute if data storage hvr:asset/effect target_effect{duration:-1} run data remove storage hvr:asset/effect target_effect

# Hand over effect if exists
    execute if data storage hvr:asset/effect target_effect run data modify storage hvr:asset/effect hand_over_effects append from storage hvr:asset/effect target_effect

# Reset
    data remove storage hvr:asset/effect target_effect
    data remove storage hvr:asset/context id
    data remove storage hvr:asset/context duration
    data remove storage hvr:asset/context level
    data remove storage hvr:asset/context self
    data remove storage hvr:asset/context previous_field

# Remove head
    data remove storage hvr:asset/effect effects[0]

# Repeat until proceed all factors
    execute if data storage hvr:asset/effect effects[0] run function hvr:entity_manager/effect/on_death/foreach