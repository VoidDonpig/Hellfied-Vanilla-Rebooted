#> hvr:core/load
#
# Load function
#
# @within tag/function minecraft:load

# Declare the artifact is production
    data modify storage hvr:core is_production set value false

# Only once loaded function
    execute if data storage hvr:core {is_production:true} unless data storage hvr:core {loaded_once:true} run function hvr:core/load_once
    execute unless data storage hvr:core {is_production:true} run function hvr:core/load_once