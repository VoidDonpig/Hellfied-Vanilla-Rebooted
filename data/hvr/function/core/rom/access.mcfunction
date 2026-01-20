#> hvr:core/rom/access
#
# Rom access function
#
# @input storage hvr:core/rom __input__.address
#
# @output storage hvr:core/rom _[-4][-4][-4][-4][-4][-4][-4][-4]

# Get address score
    execute store result score $ hvr.rom run data get storage hvr:core/rom __input__.address

# Call storage
    execute unless score $ hvr.rom = $latest_called_address hvr.rom run function hvr:core/rom/provide

# Reset
    data remove storage hvr:core/rom __input__.address
