#> hvr:core/rom/access
#
# Rom access function
#
# @input storage hvr:core/rom __input__.address
#
# @output storage hvr:core/rom _[-4][-4][-4][-4][-4][-4][-4][-4]

# Provide int id or get id
    function hvr:core/rom/allocate_int_id with storage hvr:core/rom __input__

# Call storage
    execute unless score $ hvr.rom = $latest_called_address hvr.rom run function hvr:core/rom/provide

# Reset
    data remove storage hvr:core/rom __input__.address
