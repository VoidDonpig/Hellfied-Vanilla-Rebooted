#> hvr:api/mob/summon
#
# Mob summon api
#
# @input stoarge hvr:api
#   __input__.id: string
#       Summoned mob ID
#   __input__.skip_summon?: boolean
#       Whether summon process should be skipped
#   __input__.field_override?: compound tag
#       Field override setting
#
# @api

# Validation
    execute unless data storage hvr:api __input__.id run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"Missing argument: "},{text:"id",color:"red"}]

# Summon
    execute if data storage hvr:api __input__.id run function hvr:api/mob/core/summon.m with storage hvr:api __input__

# Reset
    data remove storage hvr:api __input__.id
    data remove storage hvr:api __input__.skip_summon
    data remove storage hvr:api __input__.field_override