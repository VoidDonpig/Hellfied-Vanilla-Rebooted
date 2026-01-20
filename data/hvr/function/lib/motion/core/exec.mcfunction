#> hvr:lib/motion/core/exec
#
# Core process
#
# @within function hvr:lib/motion/exec

# Get vector value
    execute store result score $vector_magnitude hvr.temporary run data get storage hvr:lib __input__.vector_magnitude 100

# Calculate knockback resistance
    execute if data storage hvr:lib __input__{knockback_resistance:true} store result score $knockback_resistance hvr.temporary run attribute @s knockback_resistance get 100
    execute if data storage hvr:lib __input__{knockback_resistance:true} run function hvr:lib/motion/core/knockback_resistance

# Clump magnitude
    execute if score $vector_magnitude hvr.temporary matches ..-1 run scoreboard players set $vector_magnitude hvr.temporary 0
    execute if score $vector_magnitude hvr.temporary matches 1001.. run scoreboard players set $vector_magnitude hvr.temporary 1000

# Apply Motion
    execute unless score $vector_magnitude hvr.temporary matches 0 if entity @s[type=!player] run function hvr:lib/motion/core/non-player/apply

# Reset
    scoreboard players reset $vector_magnitude hvr.temporary
    scoreboard players reset $knockback_resistance hvr.temporary