#> hvr:world_manager/phenomenon/overworld/meteor/occur/
#
# Cause meteor
#
# @within function hvr:world_manager/phenomenon/overworld/meteor/draw

# If fake, just emit flash and end
    execute if score $is_real hvr.temporary matches 0 run return run function hvr:world_manager/phenomenon/overworld/meteor/occur/fake_flash/

# Summon meteor
    function hvr:world_manager/phenomenon/overworld/meteor/occur/summon_meteor/