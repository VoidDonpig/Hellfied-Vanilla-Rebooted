#> hvr:entity_manager/mob/init/converted_mob
#
# Init converted mob
#
# @within function
#   hvr:core/tick/mob/pre
#   hvr:core/tick/mob/post

# Declare flag for asset process
    data modify storage hvr:asset/mob is_newly_converted_mob set value true

# Init as new mob
    function hvr:entity_manager/mob/init/natural_mob

# Reset
    data remove storage hvr:asset/mob is_newly_converted_mob