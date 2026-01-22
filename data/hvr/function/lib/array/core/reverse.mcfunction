#> hvr:lib/array/core/reverse
#
# Reverse
#
# @within function
#   hvr:lib/array/reverse

#> Index
# @private
#declare score_holder $index

# Index
    execute store result score $index hvr.temporary if data storage hvr:lib array[]

# Move
    function hvr:lib/array/core/move

# Get from cache
    data modify storage hvr:lib array set from storage hvr:lib cache

# Reset
    scoreboard players reset $index hvr.temporary
    data remove storage hvr:lib cache
