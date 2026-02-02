#> hvr:asset/mob/enemy.spider/tick/super_leap/while_leaping/when_near_target/check
#
# Check XZ distance
#
# @within function hvr:asset/mob/enemy.spider/tick/super_leap/while_leaping/

# Get distance
    execute positioned as @n[tag=hvr.target] run function hvr:lib/horizonal_distance/as_to_at
    execute store result score $horizonal_distance hvr.temporary run data get storage hvr:lib __output__.horizonal_distance 1000

# If under threshold, proceed
    execute if score $horizonal_distance hvr.temporary matches ..1850 run function hvr:asset/mob/enemy.spider/tick/super_leap/while_leaping/when_near_target/