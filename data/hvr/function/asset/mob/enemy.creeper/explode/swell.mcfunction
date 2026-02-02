#> hvr:asset/mob/enemy.creeper/explode/swell
#
# Sync swell
#
# @within function hvr:asset/mob/enemy.creeper/tick/

# Swelling start SFX
    execute if score $swell_dir hvr.temporary matches 1.. if score @s hvr.asset.mob.creeper.swell matches 0 run function hvr:asset/mob/enemy.creeper/explode/swelling_start_sfx

# Save old swell dir
    scoreboard players operation @s hvr.asset.mob.creeper.old_swell_dir = $swell_dir hvr.temporary

# Add swell
    scoreboard players operation @s hvr.asset.mob.creeper.swell += $swell_dir hvr.temporary

# 0 <= swell
    execute if score @s hvr.asset.mob.creeper.swell matches ..-1 run scoreboard players set @s hvr.asset.mob.creeper.swell 0

# Swelling SFX
    execute if score @s hvr.asset.mob.creeper.swell matches 1.. run function hvr:asset/mob/enemy.creeper/explode/swelling_sfx

# Explode
    execute if score @s hvr.asset.mob.creeper.swell >= @s hvr.asset.mob.creeper.max_swell run function hvr:asset/mob/enemy.creeper/explode/

# Reset
    scoreboard players reset $swell_dir hvr.temporary