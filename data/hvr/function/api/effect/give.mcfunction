#> hvr:api/effect/give
#
# Give asset effect declared id to entity
#
# @input
#   as entity
#   strage hvr:api
#       __input__.id: string
#       __input__.duration?: int
#       __input__.level?: int
#       __input__.duration_operation?: enum (replace || add || force)
#       __input__.level_operation?: enum (replace || add || force)
#       __input__.field_override?: compound tag

# Validation
    execute if entity @s[type=!#hvr:living] run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"hvr:api/effect/give must be executed by living entity."}]
    execute unless data storage hvr:api __input__.id run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"Missing argument: "},{text:"id",color:"red"}]

# Exec
    execute if entity @s[type=#hvr:living] if data storage hvr:api __input__.id run function hvr:api/effect/core/give.m with storage hvr:api __input__

# Reset
    data remove storage hvr:api __input__.id
    data remove storage hvr:api __input__.duration
    data remove storage hvr:api __input__.level
    data remove storage hvr:api __input__.duration_operation
    data remove storage hvr:api __input__.level_operation
    data remove storage hvr:api __input__.field_override