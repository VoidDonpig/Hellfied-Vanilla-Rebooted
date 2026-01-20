#> hvr:core/tick/player/pre
#
# Player pre tick
#
# @within function hvr:core/tick/main

# Give exception tag
    tag @s remove hvr.player_may_exception
    execute if entity @s[gamemode=!survival,gamemode=!adventure] run tag @s add hvr.player_may_exception