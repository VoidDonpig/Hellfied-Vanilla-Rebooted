#> hvr:api/effect/core/give
#
# Give declared effect
#
# @within function hvr:api/effect/give

# Register
    function hvr:entity_manager/effect/give/register.m with storage hvr:api __input__

# Validation
    execute unless data storage hvr:asset/effect id run return run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"This id effect is not registed: "},{storage:"hvr:api",nbt:"__input__.id"}]

# Default values
    execute unless data storage hvr:api __input__.duration run data modify storage hvr:api __input__.duration set value 600d
    execute unless data storage hvr:api __input__.level run data modify storage hvr:api __input__.level set value 1d
    execute unless data storage hvr:api __input__.duration_operation run data modify storage hvr:api __input__.duration_operation set value "replace"
    execute unless data storage hvr:api __input__.level_operation run data modify storage hvr:api __input__.level_operation set value "replace"
    
    execute unless data storage hvr:asset/effect removed_on_using_milk run data modify storage hvr:asset/effect removed_on_using_milk set value true
    execute unless data storage hvr:asset/effect removed_on_death run data modify storage hvr:asset/effect removed_on_death set value true

# Set data from arguments
    data modify storage hvr:asset/effect duration set from storage hvr:api __input__.duration
    data modify storage hvr:asset/effect level set from storage hvr:api __input__.level
    data modify storage hvr:asset/effect duration_operation set from storage hvr:api __input__.duration_operation
    data modify storage hvr:asset/effect level_operation set from storage hvr:api __input__.level_operation

    execute if data storage hvr:api __input__.field_override run data modify storage hvr:asset/effect field merge from storage hvr:api __input__.field_override

# Give effect
    function hvr:entity_manager/effect/give/

# Reset
    data remove storage hvr:asset/effect id
    data remove storage hvr:asset/effect duration
    data remove storage hvr:asset/effect level
    data remove storage hvr:asset/effect duration_operation
    data remove storage hvr:asset/effect level_operation
    data remove storage hvr:asset/effect field
    data remove storage hvr:asset/effect removed_on_using_milk
    data remove storage hvr:asset/effect removed_on_death
