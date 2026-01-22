#> hvr:entity_manager/effect/foreach
#
# Procedure effects
#
# @within function
#   hvr:entity_manager/effect/tick
#   hvr:entity_manager/effect/foreach

# Get target effect
    data modify storage hvr:asset/effect target_effect set from storage hvr:asset/effect effects[-1]

# When used milk
    execute if score @s hvr.used_milk matches 1.. if data storage hvr:asset/effect target_effect{removed_on_using_milk:true} run data modify storage hvr:asset/effect target_effect.duration set value -1

# When used totem
    execute if score @s hvr.used_totem matches 1.. if data storage hvr:asset/effect target_effect{removed_on_death:true} run data modify storage hvr:asset/effect target_effect.duration set value -1

# Decrement duration
    execute unless data storage hvr:asset/effect target_effect{duration:-1} store result storage hvr:asset/effect target_effect.duration int 0.9999999999 run data get storage hvr:asset/effect target_effect.duration

# Generate context
    data modify storage hvr:asset/context id set from storage hvr:asset/effect target_effect.id
    data modify storage hvr:asset/context duration set from storage hvr:asset/effect target_effect.duration
    data modify storage hvr:asset/context level set from storage hvr:asset/effect target_effect.level
    data modify storage hvr:asset/context this set from storage hvr:asset/effect target_effect.field
    data modify storage hvr:asset/context previous_field set from storage hvr:asset/effect target_effect.previous_field

# Event tick
    execute if data storage hvr:asset/effect target_effect{queued_event:given} run function hvr:entity_manager/effect/event/given/dispatch/dispatcher.m with storage hvr:asset/effect target_effect
    execute if data storage hvr:asset/effect target_effect{queued_event:regiven} run function hvr:entity_manager/effect/event/regiven/dispatch/dispatcher.m with storage hvr:asset/effect target_effect
    execute unless data storage hvr:asset/effect target_effect{queued_event:given} unless data storage hvr:asset/effect target_effect{queued_event:regiven} unless data storage hvr:asset/effect target_effect{duration:-1} run function hvr:entity_manager/effect/event/tick/dispatch/dispatcher.m with storage hvr:asset/effect target_effect
    execute if data storage hvr:asset/effect target_effect{duration:0} run function hvr:entity_manager/effect/event/end/dispatch/dispatcher.m with storage hvr:asset/effect target_effect
    execute if data storage hvr:asset/effect target_effect{duration:-1} run function hvr:entity_manager/effect/event/remove/dispatch/dispatcher.m with storage hvr:asset/effect target_effect

# Remove no needed data
    data remove storage hvr:asset/effect target_effect.queued_event
    data remove storage hvr:asset/effect target_effect.previous_field

# Restore field
    data modify storage hvr:asset/effect target_effect.duration set from storage hvr:asset/context duration
    data modify storage hvr:asset/effect target_effect.field set from storage hvr:asset/context this

# Remove effect duration is out
    execute if data storage hvr:asset/effect target_effect{duration:0} run data remove storage hvr:asset/effect target_effect
    execute if data storage hvr:asset/effect target_effect{duration:-1} run data remove storage hvr:asset/effect target_effect

# Hand over effect if exists
    execute if data storage hvr:asset/effect target_effect run data modify storage hvr:asset/effect hand_over_effects append from storage hvr:asset/effect target_effect

# Reset
    data remove storage hvr:asset/effect target_effect
    data remove storage hvr:asset/context id
    data remove storage hvr:asset/context duration
    data remove storage hvr:asset/context level
    data remove storage hvr:asset/context this
    data remove storage hvr:asset/context previous_field

# Remove foot
    data remove storage hvr:asset/effect effects[-1]

# Repeat until proceed all factors
    execute if data storage hvr:asset/effect effects[0] run function hvr:entity_manager/effect/foreach