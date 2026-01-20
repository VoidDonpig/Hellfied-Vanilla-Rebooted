#> hvr:lib/motion/exec
#
# Set motion toward looking direction
#
# @input storage hvr:lib
#   __input__.vector_magnitude: double
#   __input__.resist_knockback?: bool
#
# @api

# Validation 
    execute unless data storage hvr:lib __input__.vector_magnitude run tellraw @a [{storage:"hvr:global",nbt:"Prefix.Error"},{text:"Missing argument: "},{text:"vector_magnitude",color:"red"}]

# Run
    execute if data storage hvr:lib __input__.vector_magnitude run function hvr:lib/motion/core/exec

# Reset
    data remove storage hvr:lib __input__.vector_magnitude
    data remove storage hvr:lib __input__.resist_knockback