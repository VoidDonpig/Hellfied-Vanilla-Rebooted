#> hvr:lib/arrow_motion/
#
# Shoot arrow toward selector entity
# Must be executed by arrow
#
# @input storage hvr:lib
#   __input__.vector_magnitude: double
#   __input__.selector: string (must be single)
#
# @api

# Validation
    execute unless entity @s[type=#hvr:arrows] run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"hvr:lib/arrow_motion/ must be executed by arrow entity."}]
    execute unless data storage hvr:lib __input__.vector_magnitude run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"Missing argument: "},{text:"vector_magnitude",color:"red"}]
    execute unless data storage hvr:lib __input__.selector run tellraw @a [{storage:"hvr:global",nbt:"prefix.error"},{text:"Missing argument: "},{text:"selector",color:"red"}]

# Exec
    execute if entity @s[type=#hvr:arrows] if data storage hvr:lib __input__.vector_magnitude if data storage hvr:lib __input__.selector run function hvr:lib/arrow_motion/core/ with storage hvr:lib __input__

# Reset
    data remove storage hvr:lib __input__.vector_magnitude
    data remove storage hvr:lib __input__.selector