#> hvr:asset/mob/enemy.hazardous.inferno/tick/remove_water/check
#
# Check water existence
#
# @within function hvr:asset/mob/enemy.hazardous.inferno/tick/

# Water check
    execute if block ~-1 ~ ~ water run return 1
    execute if block ~-1 ~ ~-1 water run return 1
    execute if block ~-1 ~ ~1 water run return 1
    execute if block ~ ~ ~ water run return 1
    execute if block ~ ~ ~-1 water run return 1
    execute if block ~ ~ ~1 water run return 1
    execute if block ~1 ~ ~ water run return 1
    execute if block ~1 ~ ~-1 water run return 1
    execute if block ~1 ~ ~1 water run return 1
    
    execute if block ~-1 ~-1 ~ water run return 1
    execute if block ~-1 ~-1 ~-1 water run return 1
    execute if block ~-1 ~-1 ~1 water run return 1
    execute if block ~ ~-1 ~ water run return 1
    execute if block ~ ~-1 ~-1 water run return 1
    execute if block ~ ~-1 ~1 water run return 1
    execute if block ~1 ~-1 ~ water run return 1
    execute if block ~1 ~-1 ~-1 water run return 1
    execute if block ~1 ~-1 ~1 water run return 1

    execute if block ~-1 ~1 ~ water run return 1
    execute if block ~-1 ~1 ~-1 water run return 1
    execute if block ~-1 ~1 ~1 water run return 1
    execute if block ~ ~1 ~ water run return 1
    execute if block ~ ~1 ~-1 water run return 1
    execute if block ~ ~1 ~1 water run return 1
    execute if block ~1 ~1 ~ water run return 1
    execute if block ~1 ~1 ~-1 water run return 1
    execute if block ~1 ~1 ~1 water run return 1

    execute if block ~-1 ~2 ~ water run return 1
    execute if block ~-1 ~2 ~-1 water run return 1
    execute if block ~-1 ~2 ~1 water run return 1
    execute if block ~ ~2 ~ water run return 1
    execute if block ~ ~2 ~-1 water run return 1
    execute if block ~ ~2 ~1 water run return 1
    execute if block ~1 ~2 ~ water run return 1
    execute if block ~1 ~2 ~-1 water run return 1
    execute if block ~1 ~2 ~1 water run return 1

# Fail
    return fail